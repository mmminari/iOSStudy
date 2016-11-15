//
//  MainPageTopCell.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainPageTopCell.h"
#import "MainPageHorizontalCollectionViewCell.h"
#import "LibraryClass.h"

#import "GBInfiniteScrollView.h"

#define deviceWidth                         [UIScreen mainScreen].bounds.size.width


@interface MainPageTopCell ()<UICollectionViewDelegate, UICollectionViewDataSource, GBInfiniteScrollViewDelegate, GBInfiniteScrollViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *userInfoView;
@property (weak, nonatomic) IBOutlet UILabel *lbUserNick;

@property (weak, nonatomic) IBOutlet GBInfiniteScrollView *infiniteScrollView;

@property (strong, nonatomic) LibraryClass *lib;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfUserInfoView;


@end

@implementation MainPageTopCell

- (void)awakeFromNib
{
    
    [super awakeFromNib];
    
    self.lib = [LibraryClass sharedInstance];
    
    // Initialization code
    [self.cvHorizontal registerNib:[UINib nibWithNibName:@"MainPageHorizontalCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageHorizontalCollectionViewCell"];
    self.cvHorizontal.delegate = self;
    self.cvHorizontal.dataSource = self;
        
    [self infiniteScrollViewSetUp];

}

#pragma mark - GBInfiniteScrollView
- (void)infiniteScrollViewSetUp
{
    self.infiniteScrollView.infiniteScrollViewDataSource = self;
    self.infiniteScrollView.infiniteScrollViewDelegate = self;
    self.infiniteScrollView.debug = NO;
    self.infiniteScrollView.verboseDebug = NO;
    self.infiniteScrollView.tapEnabled = YES;
    self.infiniteScrollView.animationDuration = 0.7f;
    self.infiniteScrollView.interval = 3.0f;
    self.infiniteScrollView.pageIndex = 0;
    self.infiniteScrollView.autoScrollDirection = GBAutoScrollDirectionRightToLeft;
    self.infiniteScrollView.scrollDirection = GBScrollDirectionHorizontal;
    self.infiniteScrollView.useInfiniteScrollPanGestureRecognizer = NO;
}

#pragma mark - GBInfiniteScrollViewDelegate

- (void)infiniteScrollViewDidScrollNextPage:(GBInfiniteScrollView *)infiniteScrollView
{
   // [self setUserIfoViewAnimation];
}

- (void)infiniteScrollViewDidScrollPreviousPage:(GBInfiniteScrollView *)infiniteScrollView
{
   // [self setUserIfoViewAnimation];
}

- (BOOL)infiniteScrollViewShouldScrollNextPage:(GBInfiniteScrollView *)infiniteScrollView
{
    return YES;
}

- (BOOL)infiniteScrollViewShouldScrollPreviousPage:(GBInfiniteScrollView *)infiniteScrollView
{
    return YES;
}

- (NSInteger)numberOfPagesInInfiniteScrollView:(GBInfiniteScrollView *)infiniteScrollView
{
    NSInteger rowCount = self.mainCoverList.count;
    
    return rowCount;
}

- (GBInfiniteScrollViewPage *)infiniteScrollView:(GBInfiniteScrollView *)infiniteScrollView pageAtIndex:(NSUInteger)index;
{
    GBInfiniteScrollViewPage *page = [infiniteScrollView dequeueReusablePage];
    
    if (page == nil) {
        page = [[GBInfiniteScrollViewPage alloc] initWithFrame:CGRectMake(0, 0, deviceWidth, deviceWidth) style:GBInfiniteScrollViewPageStyleCustom];
    }
    
    [page.contentView addSubview:[self addInfiniteScrollViewPageAtIndex:index]];
    
    [self setUserIfoViewAnimation];
    
    return page;
}


- (UIView *)addInfiniteScrollViewPageAtIndex:(NSInteger)index
{
    
    UIView *result = [[UIView alloc]initWithFrame:CGRectMake(0, 0, deviceWidth, deviceWidth)];
    
    if(index == 0 || index == 3)
    {
        result.backgroundColor = [UIColor blueColor];
    }
    else
    {
        result.backgroundColor = [UIColor grayColor];
    }
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:result.frame];
    
    [self.lib setImageView:iv urlString:self.mainCoverList[index] placeholderImage:nil animation:YES];
    
    [result addSubview:iv];
    
    self.alcBottomOfUserInfoView.constant = -50.0f;
    
    self.lbUserNick.text = [NSString stringWithFormat:@"index : %zd", index];   
    
    [self layoutIfNeeded];
    
    return result;

}

- (void)setUserIfoViewAnimation
{
    NSTimeInterval animationDuration = 0.5f;
        
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0.4f options:animationOptions animations:^{
        
        self.alcBottomOfUserInfoView.constant = 0.0;
        
        [self layoutIfNeeded];
        
    } completion:nil];
    
}

- (UIView *)addSubViewForUserInfoAtIndex:(NSInteger)index
{
    UIView *result = [[UIView alloc]initWithFrame:CGRectMake(0, deviceWidth, deviceWidth, 50.0f)];
    
    if(index == 0 || index == 3)
    {
        result.backgroundColor = [UIColor blueColor];
    }
    else
    {
        result.backgroundColor = [UIColor grayColor];
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:result.frame];
    
    label.text = [NSString stringWithFormat:@"index : %zd", index];
    
    [result addSubview:label];
    
    return result;
}


- (void)startAutoScroll
{
    [self.infiniteScrollView startAutoScroll];
}

- (void)stopAutoScroll
{
    [self.infiniteScrollView stopAutoScroll];
}

#pragma mark - UICollectionView

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

#pragma mark - User Action


@end
