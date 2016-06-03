//
//  LogOutCollectionViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "LogOutCollectionViewController.h"
#import "LogOutCollectionCell.h"

@interface LogOutCollectionViewController ()

@end

@implementation LogOutCollectionViewController


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
    
    return cell;
    
    
}

@end
