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

@interface ThubmnailCollectionViewController ()

@property (strong, nonatomic) ShowMenuViewController *naviVC;
@property (weak, nonatomic) IBOutlet UICollectionView *cvThumbnail;
@property (strong, nonatomic) NSArray *thumbArr;
@property (weak, nonatomic) IBOutlet UIView *cvThumbnailContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCvContainer;

@end

@implementation ThubmnailCollectionViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    self.thumbArr = [NSArray new];
    
    self.naviVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view addSubview:self.naviVC.view];
    [self.util setContentViewLayoutWithSubView2:self.naviVC.view withTargetView:self.view];
    [self.naviVC.ivBack setHidden:YES];
    self.naviVC.lbTitle.text = @"^______^";
    self.alcHeightOfCvContainer.constant = DEVICE_HEIGHT-HRATIO_HEIGHT(213.0f);
    [self reqThumbnailInformation];
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat width = (DEVICE_WIDTH - 20)/ 3;
    CGFloat height = width;
    
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0f;
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
    
    if(self.thumbArr.count > 0)
    {
        Photo *thumbnailInfo = self.thumbArr[indexPath.row];
        
        [self.library setImageView:cell.ivThumbnail urlString:[thumbnailInfo urlM] placeholderImage:nil animation:NO];
        cell.ivThumbnail.contentMode = UIViewContentModeScaleAspectFill;

    }
    
 //   cell.layoutMargins = UIEdgeInsetsMake(2.5f, 0.0, 2.5f, 5.0f);

    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    DetailThumbnailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-thumbDetail"];

    [self.navigationController pushViewController:detailVC animated:YES];
    
    detailVC.photo = self.thumbArr[indexPath.row];
    
}

-(void)reqThumbnailInformation
{
    NSDictionary *parameterDic = @{ @"method" : @"flickr.photos.getRecent",
                                    @"api_key" : @"a7b7b6ba8cc4213db5f1a773830e07a5",
                                    @"format" : @"json",
                                    @"extras" : @"url_m",
                                    @"nojsoncallback" : @1,
                                    @"page" : @1,
                                    @"per_page" : @30 };
    
    [self.library requestThumbnailInformationWithParameter:parameterDic success:^(id results)
    {
        BaseFlickrModel *baseModel = [BaseFlickrModel modelObjectWithDictionary:results];
        self.thumbArr = baseModel.photos.photo;
        
        [self.cvThumbnail reloadData];
        
    } failure:^(NSError *error)
    {
        LogRed(@"reqThumb fail");
        
    }];
    
}


@end
