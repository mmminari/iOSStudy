//
//  MainPageTopCell.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainPageTopCell.h"
#import "MainPageHorizontalCollectionViewCell.h"

@interface MainPageTopCell ()<UICollectionViewDelegate, UICollectionViewDataSource>


@end

@implementation MainPageTopCell



- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    [self.cvHorizontal registerNib:[UINib nibWithNibName:@"MainPageHorizontalCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageHorizontalCollectionViewCell"];
    self.cvHorizontal.delegate = self;
    self.cvHorizontal.dataSource = self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
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
    static NSString *cellID = @"MainPageHorizontalCollectionViewCell";
    
    MainPageHorizontalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];

     if(indexPath.row == 0 || indexPath.row == 2)
     {
         cell.colorView.backgroundColor = [UIColor purpleColor];
     }
    else if(indexPath.row == 1 || indexPath.row == 3)
    {
        cell.colorView.backgroundColor = [UIColor grayColor];

    }
    
    return cell;
}

@end
