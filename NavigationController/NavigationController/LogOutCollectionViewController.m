//
//  LogOutCollectionViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "LogOutCollectionViewController.h"
#import "LogOutCollectionCell.h"
#import "ImageDownload.h"
#import "IntroInformation.h"
#import "MainInformation.h"

@interface LogOutCollectionViewController ()

@property (strong, nonatomic) NSMutableArray *backgroundArr;
@property (strong, nonatomic) NSMutableArray *backgroundContentArr;
@property (strong, nonatomic) NSMutableArray *contentArr;

@property (strong, nonatomic) NSMutableDictionary *backgroundDic;
@property (strong, nonatomic) NSMutableDictionary *backgroundContentDic;
@property (strong, nonatomic) NSMutableDictionary *contentDic;

@property (weak, nonatomic) IBOutlet UIButton *btnRegCard;
@property (weak, nonatomic) IBOutlet UILabel *lbLogIn;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;


@end

@implementation LogOutCollectionViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundArr = [NSMutableArray array];
    self.backgroundDic = [NSMutableDictionary dictionary];
    
    self.backgroundContentArr = [NSMutableArray array];
    self.backgroundContentDic = [NSMutableDictionary dictionary];
    
    self.contentArr = [NSMutableArray array];
    self.contentDic = [NSMutableDictionary dictionary];
    
    NSLog(@"lib %@", self.library);
    NSLog(@"main - intro - arr %@", self.library.mainInfo);
    
    [self.btnRegCard setBackgroundColor:[self.util getColorWithRGBCode:@"f386a1"]];
    [self.btnRegCard setTitle:@"     포인트 카드 발급 등록     " forState:UIControlStateNormal];
    [self.btnRegCard setTitleColor:[self.util getColorWithRGBCode:@"ffffff"] forState:UIControlStateNormal];
    self.btnRegCard.titleLabel.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(46.0f)];
    /*
    NSString *info = @"로그인 하시면 더 많은 혜택을 받으실 수 있습니다. 로그인 >";
    self.lbLogIn.font = [UIFont systemFontOfSize:WRATIO_WIDTH(46.0f)];
    self.lbLogIn.textColor = [self.util getColorWithRGBCode:@"b0b0b0"];
    
    NSMutableAttributedString *addInfo = [[NSMutableAttributedString alloc]initWithString:@"로그인 하시면 더 많은 혜택을 받으실 수 있습니다. 로그인 >"];
    
    NSRange range = [info rangeOfString:@"로그인 >"];
    
    [addInfo addAttribute:NSForegroundColorAttributeName value:[self.util getColorWithRGBCode:@"f386a1"] range:NSMakeRange(range.location, addInfo.length)];
        
    self.lbLogIn.attributedText = addInfo;
    
    */
    
    self.introList = self.introList;

}

//collectinViewCell의 Min Spacting을 0으로 주어야 셀이 밀리는 것을 방지할 수 있음
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.pageController.numberOfPages = self.introList.count;
    return self.introList.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat width = DEVICE_WIDTH;
    CGFloat height = DEVICE_HEIGHT - 71.0f;
    
    return CGSizeMake(width, height);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"logOutCollectionCell";

    
    LogOutCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.alcHeightOfContainerView.constant = WRATIO_WIDTH(524.0f);
    cell.contentView.backgroundColor = [UIColor blackColor];
    
    [self startDownloadBackgroundImageWithIndexPath:indexPath];
    [self startDownloadContentImageWithIndexPath:indexPath];
    [self startDownloadContentBackgroundImageWithIndexPath:indexPath];
    
    NSInteger countBackground = self.backgroundArr.count;
    NSInteger countContent = self.contentArr.count;
    NSInteger countContentBackground = self.backgroundContentArr.count;
    
    if(countBackground >0)
    {
        UIImage *imgBackgound = nil;
        
        @try
        {
            imgBackgound = self.backgroundArr[indexPath.row];

        }
        @catch (NSException *exception)
        {
            
        }
        
        if(!imgBackgound)
        {
            [self startDownloadBackgroundImageWithIndexPath:indexPath];
        }
        else
        {
            cell.ivBackground.image = imgBackgound;
        }
        
    }
    if(countContent >0)
    {

        UIImage *imgContent = nil;
        
        @try
        {
            imgContent = self.contentArr[indexPath.row];
        }
        @catch (NSException *exception)
        {
            
        }

        if(!imgContent)
        {
            [self startDownloadContentImageWithIndexPath:indexPath];
        }
        else
        {
            cell.ivContent.image = imgContent;
        }
    }

    if(countContentBackground >0)
    {
        UIImage *imgContentBackground = nil;
        
        @try
        {
            imgContentBackground = self.backgroundContentArr[indexPath.row];
        }
        @catch (NSException *exception)
        {
            
        }
        
        if(!imgContentBackground)
        {
            [self startDownloadContentBackgroundImageWithIndexPath:indexPath];
        }
        else
        {
            cell.ivContentBackground.image = imgContentBackground;
        }

    }
    
    return cell;

}

-(void)startDownloadBackgroundImageWithIndexPath:(NSIndexPath *)indexPath
{
    ImageDownload *imageDown = self.backgroundDic[indexPath];
    if(imageDown == nil)
    {
        imageDown = [[ImageDownload alloc]init];
        imageDown.imageArr = self.backgroundArr;
        
        IntroInformation *info = self.introList[indexPath.row];

        imageDown.urlString = [info backgroundUri];
        NSLog(@"url string : %@", imageDown.urlString);
        NSLog(@" count : %zd", self.introList.count);
        
        
        [imageDown setCompletionHandler:^
        {
            //속성을 보다 작은 곳에 담을 때에는 타입을 명시적으로 지정해주어야 한다
            LogOutCollectionCell *cell = (LogOutCollectionCell *)[self.cvLogOut cellForItemAtIndexPath:indexPath];

            @try
            {
                cell.ivBackground.image = self.backgroundArr[indexPath.row];
            }
            @catch (NSException *exception)
            {
                
            }
            [self.backgroundDic removeObjectForKey:indexPath];
            
        }];
        
        self.backgroundDic[indexPath] = imageDown;
        
        [imageDown stardDownload];
    }
}

-(void)startDownloadContentBackgroundImageWithIndexPath:(NSIndexPath *)indexPath
{
    ImageDownload *imageDown = self.backgroundContentDic[indexPath];
    if(imageDown == nil)
    {
        imageDown = [[ImageDownload alloc]init];
        imageDown.imageArr = self.backgroundContentArr;
        
        IntroInformation *info = self.introList[indexPath.row];
        
        imageDown.urlString = [info contentBackgroundUri];
   
        [imageDown setCompletionHandler:^
        {
            LogOutCollectionCell *cell = (LogOutCollectionCell *)[self.cvLogOut cellForItemAtIndexPath:indexPath];
            
            @try
            {
                cell.ivContentBackground.image = self.backgroundContentArr[indexPath.row];
            }
            @catch (NSException *exception)
            {
                
            }
            [self.backgroundContentDic removeObjectForKey:indexPath];

        }];
        
        self.backgroundContentDic[indexPath] = imageDown;
        
        [imageDown stardDownload];
    }
}

-(void)startDownloadContentImageWithIndexPath:(NSIndexPath *)indexPath
{
    ImageDownload *imageDown = self.contentDic[indexPath];
    
    if(imageDown == nil)
    {
        imageDown = [[ImageDownload alloc]init];
        imageDown.imageArr = self.contentArr;
        
        IntroInformation *info = self.introList[indexPath.row];
        
        imageDown.urlString = [info contentUri];
        NSLog(@"content %@", [info contentUri]);
        
        [imageDown setCompletionHandler:^
        {
            LogOutCollectionCell *cell = (LogOutCollectionCell *)[self.cvLogOut cellForItemAtIndexPath:indexPath];
            
            @try
            {
                cell.ivContent.image = self.contentArr[indexPath.row];
                cell.alcWidthOfIvContent.constant = WRATIO_WIDTH([info contentWidth]);
                cell.alcHeightOfIvContent.constant = WRATIO_WIDTH([info contentHeight]);
                NSLog(@"width : %f height : %f", WRATIO_WIDTH([info contentWidth]), WRATIO_WIDTH([info contentHeight]));
            }
            @catch (NSException *exception)
            {
                
            }
            [self.contentDic removeObjectForKey:indexPath];

        }];
        
        self.contentDic[indexPath] = imageDown;
        
        [imageDown stardDownload];

    }
}

-(void)loadImageOnVisibleCells
{
    NSArray *arr = [self.cvLogOut indexPathsForVisibleItems];
    if(self.contentArr > 0)
    {
        for(NSIndexPath *path in arr)
        {
            UIImage *image = nil;
            @try {
                LogOutCollectionCell *cell = (LogOutCollectionCell *)[self.cvLogOut cellForItemAtIndexPath:path];
                image = self.contentArr[path.row];
                cell.ivContent.image = image;
            }
            @catch (NSException *exception)
            {
                
            }
            if(!image)
            {
                [self startDownloadContentImageWithIndexPath:path];
                
            }
            
        }
    }
    if(self.backgroundArr > 0)
    {
        for(NSIndexPath *path in arr)
        {
            UIImage *image = nil;
            @try {
                LogOutCollectionCell *cell = (LogOutCollectionCell *)[self.cvLogOut cellForItemAtIndexPath:path];
                image = self.backgroundArr[path.row];
                cell.ivBackground.image = image;
            }
            @catch (NSException *exception)
            {
                
            }
            if(!image)
            {
                [self startDownloadBackgroundImageWithIndexPath:path];
                
            }
          
        }
    }

    if(self.backgroundContentArr > 0)
    {
        for(NSIndexPath *path in arr)
        {
            UIImage *image = nil;
            @try {
                LogOutCollectionCell *cell = (LogOutCollectionCell *)[self.cvLogOut cellForItemAtIndexPath:path];
                image = self.backgroundContentArr[path.row];
                cell.ivContentBackground.image = image;
            }
            @catch (NSException *exception)
            {
                
            }
            if(!image)
            {
                [self startDownloadContentBackgroundImageWithIndexPath:path];
                
            }

        }
    }


}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImageOnVisibleCells];

    self.pageController.currentPage = [self.cvLogOut.indexPathsForVisibleItems lastObject].row;
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(!decelerate)
    {
        [self loadImageOnVisibleCells];

    }
}

@end
