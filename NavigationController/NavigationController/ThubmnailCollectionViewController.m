//
//  ThubmnailCollectionViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 11..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ThubmnailCollectionViewController.h"
#import "ShowMenuViewController.h"
#import "ThumbnailCell.h"
#import "DetailThumbnailViewController.h"

#import "FlickrDataModels.h"

@interface ThubmnailCollectionViewController ()<ThumbnailDelegate, NavigationDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *cvThumbnail;
@property (weak, nonatomic) IBOutlet UIView *cvThumbnailContainer;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCvContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfCv;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfCv;

@property (strong, nonatomic) ShowMenuViewController *naviVC;
@property (strong, nonatomic) NSArray *thumbArr;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (assign, nonatomic) NSInteger pageCount;


@end

@implementation ThubmnailCollectionViewController

#pragma mark - View Cycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    self.thumbArr = [NSArray array];
    self.pageCount = 1;

    self.naviVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view addSubview:self.naviVC.view];
    [self.util setContentViewLayoutWithSubView2:self.naviVC.view withTargetView:self.view];
    [self.naviVC.ivBack setHidden:YES];
    self.naviVC.lbTitle.text = @"^______^";
    [self.naviVC.btnCamera setHidden:NO];
    self.naviVC.delegate = self;
    
    self.alcHeightOfCvContainer.constant = DEVICE_HEIGHT-HRATIO_HEIGHT(213.0f);
    [self reqThumbnailInformationWithIsRefresh:YES];
    
    self.alcLeadingOfCv.constant = WRATIO_WIDTH(15.0f);
    self.alcTrailingOfCv.constant = WRATIO_WIDTH(15.0f);
    
    [self.cvThumbnail addSubview:[self makeRefreshControl]];
}

#pragma mark - UIImagePickerControllerDelegate

-(void)didTouchCameraButton
{
    [self startCameraControllerFromViewController:self usingDelegate:self];
    
}

-(BOOL)startCameraControllerFromViewController:(UIViewController *)controller usingDelegate:(id<UIImagePickerControllerDelegate, UINavigationControllerDelegate>)delegate
{
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc]init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    cameraUI.delegate = delegate;
    
    [controller presentViewController:cameraUI animated:YES completion:nil];

    return YES;
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,
                               id> *)info
{
    LogGreen(@"image info : %@", info);
    Photo *newPhoto = [[Photo alloc]init];
    UIImage *originalImg = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    newPhoto.localPhoto = originalImg;
    newPhoto.heightM = [NSString stringWithFormat:@"%f",originalImg.size.height] ;
    newPhoto.widthM = [NSString stringWithFormat:@"%f", originalImg.size.width];
    
    [self.cvThumbnail performBatchUpdates:^
     {
         NSMutableArray *tempArr = self.thumbArr.mutableCopy;
         [tempArr insertObject:newPhoto atIndex:self.thumbArr.count];
         
         //[tempArr addObject:newPhoto];
         self.thumbArr = (NSArray *)tempArr;
         LogYellow(@"thumbArr : %zd", self.thumbArr.count);

         NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.thumbArr.count -1 inSection:0];
         
         LogYellow(@"indexcount : %zd", indexPath.row);
         [self.cvThumbnail insertItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
        
     } completion:^(BOOL finished)
     {
         [self.cvThumbnail reloadData];
         [picker dismissViewControllerAnimated:YES completion:nil];
     }];

}

#pragma mark - UICollectionViewDelegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat width = (DEVICE_WIDTH - WRATIO_WIDTH(15.0f)*4)/ 3 ;
    width = (NSInteger)width;
    
    CGFloat height = width;
    
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return WRATIO_WIDTH(15.0f);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return WRATIO_WIDTH(15.0f);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.thumbArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellId = @"thumbCell";
    
    ThumbnailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.delegate = self;
    cell.indexPath = indexPath;
    
    LogGreen(@"cell.indexPath : %zd", cell.indexPath.row);
    
    [cell.ivDelete setHidden:YES];
    [cell.btnDelete setHidden:YES];
    
    if(self.thumbArr.count > 0)
    {
        Photo *thumbnailInfo = self.thumbArr[indexPath.row];
        
        LogBlue(@"url : %@", [thumbnailInfo urlM]);
        
        
        if([thumbnailInfo urlM] == nil)
        {
            cell.ivThumbnail.image = [thumbnailInfo localPhoto];
            [cell.ivDelete setHidden:NO];
            [cell.btnDelete setHidden:NO];
        }
        else
        {
            [self.library setImageView:cell.ivThumbnail urlString:[thumbnailInfo urlM] placeholderImage:nil animation:YES completed:^(BOOL complete) {
                [cell.ivDelete setHidden:NO];
                [cell.btnDelete setHidden:NO];
            }];
        }
        
        cell.ivThumbnail.contentMode = UIViewContentModeScaleAspectFill;
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    DetailThumbnailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-thumbDetail"];

    [self.navigationController pushViewController:detailVC animated:YES];
    
    detailVC.photo = self.thumbArr[indexPath.row];
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSArray *cellArr = [self.cvThumbnail visibleCells];
    
    for (id  cell in cellArr)
    {
        NSInteger cellIndex = [self.cvThumbnail indexPathForCell:cell].row;
        if(cellIndex == self.thumbArr.count - 1 && self.thumbArr.count < 150)
        {
            //[self reqThumbnailInformationWithIsRefresh:NO];
            break;
        }
    }
}

#pragma mark - Request

-(void)reqThumbnailInformationWithIsRefresh:(BOOL)isRefresh
{
    if(isRefresh)
    {
        self.pageCount = 1;
    }
    else
    {
        self.pageCount += self.pageCount ;
    }
        
    NSDictionary *parameterDic = @{ @"method" : @"flickr.photos.getRecent",
                                    @"api_key" : @"a7b7b6ba8cc4213db5f1a773830e07a5",
                                    @"format" : @"json",
                                    @"extras" : @"url_m",
                                    @"nojsoncallback" : @1,
                                    @"page" : [NSNumber numberWithInteger:self.pageCount],
                                    @"per_page" : @30 };
    
    [self.library requestThumbnailInformationWithParameter:parameterDic success:^(id results)
    {
        BaseFlickrModel *baseModel = [BaseFlickrModel modelObjectWithDictionary:results];
        if(isRefresh)
        {
            self.thumbArr = baseModel.photos.photo;
        }
        else
        {
            NSMutableArray *tempArr = self.thumbArr.mutableCopy;
            
            [tempArr addObjectsFromArray:baseModel.photos.photo];
    
            self.thumbArr = (NSArray *)tempArr;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.cvThumbnail reloadData];
            [self.refreshControl endRefreshing];
            self.cvThumbnail.userInteractionEnabled = YES;
        });
        
    } failure:^(NSError *error)
    {
        LogRed(@"reqThumb fail");
    }];
}

#pragma mark - ThumbnailDeletae

-(void)didTouchDeletebuttonWithIndexPath:(NSIndexPath *)indexPath
{
    [self.cvThumbnail performBatchUpdates:^
    {
        NSMutableArray *tempArr = self.thumbArr.mutableCopy;
        [tempArr removeObjectAtIndex:indexPath.row];
        self.thumbArr = (NSArray *)tempArr;
        
        [self.cvThumbnail deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];

    } completion:^(BOOL finished)
    {
        [self.cvThumbnail reloadData];
    }];
    
    LogGreen(@"indexPath : %zd", indexPath.row);
}

#pragma mark - Private Method

-(UIRefreshControl *)makeRefreshControl
{
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(beginRefreshing:) forControlEvents:UIControlEventValueChanged];
    
    return self.refreshControl;
}

-(void)beginRefreshing:(UIRefreshControl *)control
{
    [self reqThumbnailInformationWithIsRefresh:YES];
    self.cvThumbnail.userInteractionEnabled = NO;
}

@end
