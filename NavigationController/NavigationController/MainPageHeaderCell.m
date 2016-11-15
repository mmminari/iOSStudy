//
//  MainPageHeaderCell.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 17..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainPageHeaderCell.h"
#import "MainPageBannerCell.h"
#import "LibraryClass.h"

@interface MainPageHeaderCell () <UICollectionViewDelegate, UICollectionViewDataSource, MainPageBannerCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *cvBanner;



@property (strong, nonatomic) LibraryClass *lib;


@end

@implementation MainPageHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.cvBanner.delegate = self;
    self.cvBanner.dataSource = self;
    
    [self.cvBanner registerNib:[UINib nibWithNibName:@"MainPageBannerCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageBannerCell"];
    
    self.lib = [LibraryClass sharedInstance];
    
    self.bannerList = [self getBannerList];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    LogGreen(@"count : %zd", self.bannerList.count);
    return self.bannerList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    MainPageBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainPageBannerCell" forIndexPath:indexPath];
    
    cell.ivBanner.backgroundColor = [UIColor grayColor];
    cell.delegate = self;
    cell.index = indexPath.row;
    cell.maxIndex = self.bannerList.count - 1;
    
    [self.lib setImageView:cell.ivBanner urlString:self.bannerList[indexPath.row] placeholderImage:nil animation:YES];
    
    [cell hideBannerMoveButtonWithIndex:indexPath.row];

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(300.0f, 60.0f);
    
}

#pragma mark - Private Method

- (NSArray *)getBannerList
{
    NSArray *result = [NSArray array];
    
    result = @[@"https://fanbookfile.s3.amazonaws.com/banner/2016/11/11/m_banner_lay_cbx_e.jpg", @"https://fanbookfile.s3.amazonaws.com/banner/2016/10/11/pc_exc_banner_e.jpg", @"https://fanbookfile.s3.amazonaws.com/banner/2016/10/11/m_banner_e.jpg"];
    
    return result;
}

#pragma mark - MainPageBannerCellDelegate

- (void)didTouchNextButtonWithIndex:(NSInteger)index
{
    LogGreen(@"didTouchNextButtonWithIndex : %zd", index);
    [self.cvBanner scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index+1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (void)didTouchPreviousButtonWithIndex:(NSInteger)index
{
    LogGreen(@"didTouchPreviousButtonWithIndex: %zd", index);
    [self.cvBanner scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index-1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}



@end
