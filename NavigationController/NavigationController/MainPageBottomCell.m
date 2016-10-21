//
//  MainPageBottomCell.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainPageBottomCell.h"
#import "MainPageWaterFallCell.h"
#import "CHTCollectionViewWaterfallLayout.h"

@interface MainPageBottomCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *cvWaterFall;

@end

@implementation MainPageBottomCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.cvWaterFall registerNib:[UINib nibWithNibName:@"MainPageWaterFallCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageWaterFallCell"];
    self.cvWaterFall.delegate = self;
    self.cvWaterFall.dataSource = self;
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width/2;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    return CGSizeMake(width, height);
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"MainPageWaterFallCell";
    
    MainPageWaterFallCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    if(indexPath.row == 0 || indexPath.row == 2)
    {
        cell.colorView.backgroundColor = [UIColor darkGrayColor];
    }
    else if(indexPath.row == 1 || indexPath.row == 3)
    {
        cell.colorView.backgroundColor = [UIColor blueColor];
        
    }
    
    return cell;
}

@end
