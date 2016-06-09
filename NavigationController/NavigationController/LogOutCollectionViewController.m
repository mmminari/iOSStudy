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

@interface LogOutCollectionViewController ()

@property (strong, nonatomic) NSMutableArray *backgroundArr;
@property (strong, nonatomic) NSMutableArray *backgroundContentArr;
@property (strong, nonatomic) NSMutableArray *contentArr;

@property (strong, nonatomic) NSMutableDictionary *backgroundDic;
@property (strong, nonatomic) NSMutableDictionary *backgroundContentDic;
@property (strong, nonatomic) NSMutableDictionary *contentDic;

@property (weak, nonatomic) IBOutlet UICollectionView *cvLogOut;
@property (weak, nonatomic) IBOutlet UIButton *btnRegCard;
@property (weak, nonatomic) IBOutlet UILabel *lbLogIn;

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
    NSLog(@" %@", self.library.mainInfo.introInformationArr[1]);
    
    [self.btnRegCard setBackgroundColor:[self.util getColorWithRGBCode:@"f386a1"]];
    [self.btnRegCard setTitle:@"포인트 카드 발급 등록" forState:UIControlStateNormal];
    [self.btnRegCard setTitleColor:[self.util getColorWithRGBCode:@"ffffff"] forState:UIControlStateNormal];
    
                                    
    

}

//collectinViewCell의 Min Spacting을 0으로 주어야 셀이 밀리는 것을 방지할 수 있음
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
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
    
    if(indexPath.item == 0)
    {
        cell.contentView.backgroundColor = [UIColor blackColor];
        
    }
    if(indexPath.item == 1)
    {
        cell.contentView.backgroundColor = [UIColor blackColor];
    }
    if(indexPath.item == 2)
    {
        cell.contentView.backgroundColor = [UIColor blackColor];
    }
    if(indexPath.item == 3)
    {
        cell.contentView.backgroundColor = [UIColor blackColor];
    }
    if(indexPath.item == 4)
    {
        cell.contentView.backgroundColor = [UIColor blackColor];
    }
    if(indexPath.item == 5)
    {
        cell.contentView.backgroundColor = [UIColor blackColor];
    }
    if(indexPath.item == 6)
    {
        cell.contentView.backgroundColor = [UIColor blackColor];
    }
    
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
        
        IntroInformation *info = self.library.mainInfo.introInformationArr[indexPath.row];

        imageDown.urlString = [info backgroundUri];
        NSLog(@"url string : %@", imageDown.urlString);
        NSLog(@" count : %zd", self.library.mainInfo.introInformationArr.count);
        
        
        [imageDown setCompletionHandler:^
        {
            LogOutCollectionCell *cell = [self.cvLogOut cellForItemAtIndexPath:indexPath];

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
        
        IntroInformation *info = self.library.mainInfo.introInformationArr[indexPath.row];
        
        imageDown.urlString = [info contentBackgroundUri];
   
        [imageDown setCompletionHandler:^
        {
            LogOutCollectionCell *cell = [self.cvLogOut cellForItemAtIndexPath:indexPath];
            
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
        
        IntroInformation *info = self.library.mainInfo.introInformationArr[indexPath.row];
        
        imageDown.urlString = [info contentUri];
        NSLog(@"content %@", [info contentUri]);
        
        
        [imageDown setCompletionHandler:^{
            LogOutCollectionCell *cell = [self.cvLogOut cellForItemAtIndexPath:indexPath];
            NSLog(@"cdll : %@", cell);
            
            @try
            {
                cell.ivContent.image = self.contentArr[indexPath.row];
                cell.alcWidthOfIvContent.constant = WRATIO_WIDTH([info contentWidth]);
                cell.alcHeightOfIvContent.constant = WRATIO_WIDTH([info contentHeight]);
                NSLog(@"width : %f height : %f", WRATIO_WIDTH([info contentWidth]), WRATIO_WIDTH([info contentHeight    ]));
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
@end
