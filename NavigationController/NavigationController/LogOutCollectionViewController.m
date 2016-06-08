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
@property (weak, nonatomic) IBOutlet UICollectionView *cvLogOut;

@end

@implementation LogOutCollectionViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundArr = [NSMutableArray array];
    self.backgroundDic = [NSMutableDictionary dictionary];
    NSLog(@"lib %@", self.library);
    NSLog(@"main - intro - arr %@", self.library.mainInfo);
    NSLog(@" %@", self.library.mainInfo.introInformationArr[1]);

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
    
    if(indexPath.item == 0)
    {
        cell.contentView.backgroundColor = [UIColor blueColor];
    }
    if(indexPath.item == 1)
    {
        cell.contentView.backgroundColor = [UIColor brownColor];
    }
    if(indexPath.item == 2)
    {
        cell.contentView.backgroundColor = [UIColor yellowColor];
    }
    if(indexPath.item == 3)
    {
        cell.contentView.backgroundColor = [UIColor grayColor];
    }
    if(indexPath.item == 4)
    {
        cell.contentView.backgroundColor = [UIColor greenColor];
    }
    if(indexPath.item == 5)
    {
        cell.contentView.backgroundColor = [UIColor purpleColor];
    }if(indexPath.item == 6)
    {
        cell.contentView.backgroundColor = [UIColor magentaColor];
    }
    
    IntroInformation *info = self.library.mainInfo.introInformationArr[indexPath.row];
    
    NSString *urlString = [info backgroundUri];
    
    [self startDownloadBackgroundImage:urlString forIndexPath:indexPath];
    
    NSInteger count = self.backgroundArr.count;
    
    if(count >0)
    {
        UIImage *image = nil;
        
        @try
        {
            image = self.backgroundArr[indexPath.row];
        }
        @catch (NSException *exception)
        {
            
        }
        
        if(!image)
        {
            [self startDownloadBackgroundImage:urlString forIndexPath:indexPath];
        }
        else
        {
            cell.ivBackground.image = image;
        }
    }
    
    
    
    return cell;

}

-(void)startDownloadBackgroundImage:(NSString *)url forIndexPath:(NSIndexPath *)indexPath
{
    ImageDownload *imageDown = self.backgroundDic[indexPath];
    if(imageDown == nil)
    {
        imageDown = [[ImageDownload alloc]init];
        imageDown.imageArr = self.backgroundArr;
        
        IntroInformation *info = self.library.mainInfo.introInformationArr[indexPath.row];

        imageDown.urlString = [info backgroundUri];
        
        [imageDown setCompletionHandler:^{
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
@end
