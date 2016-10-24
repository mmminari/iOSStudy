//
//  FBWaterfallLayoutViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "FBWaterfallLayoutViewController.h"
#import "MainPageTopCell.h"
#import "MainPageBottomCell.h"
#import "MainPageHeaderCell.h"
#import "CHTCollectionViewWaterfallLayout.h"

@interface FBWaterfallLayoutViewController () <CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDelegateFlowLayout >

@property (strong, nonatomic) IBOutlet UICollectionView *cvMain;
@property (strong, nonatomic) UIView *headerView;

@property (nonatomic, strong) NSMutableArray *cellHeights;

@property (weak, nonatomic) IBOutlet CHTCollectionViewWaterfallLayout *waterfallLayout;


@end

@implementation FBWaterfallLayoutViewController

//static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageTopCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageTopCell"];
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageBottomCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageBottomCell"];
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageHeaderCell" bundle:nil] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"MainPageHeaderCell"];
    
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"MainPageHeaderCell" owner:self options:nil]lastObject];
    self.headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, WRATIO_WIDTH(50.0f));
    MainPageHeaderCell *headerCell = (MainPageHeaderCell *)self.headerView;
    headerCell.lbSection.text = @"Section 1";
    [self.view addSubview:self.headerView];
    [self.headerView setHidden:YES];

}


#pragma mark - HeaderView

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSAssert([kind isEqualToString:CHTCollectionElementKindSectionHeader], @"Unexpected supplementary element kind");
    UICollectionReusableView* cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                        withReuseIdentifier:@"MainPageHeaderCell"
                                                                               forIndexPath:indexPath];
    
    NSAssert([cell isKindOfClass:[MainPageHeaderCell class]], @"Unexpected class for header cell");
    
    MainPageHeaderCell* header_view = (MainPageHeaderCell*) cell;
    
    NSInteger section = indexPath.section;
    
    switch (section) {
        case 0:
            header_view.lbSection.text = @"Section 0";
            break;
        case 1:
            header_view.lbSection.text = @"Section 1";
            break;
        default:
            break;
    }
    return cell;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    
    CGFloat result = 0.0f;
    
    if(section == 1)
    {
        result = WRATIO_WIDTH(50.0f);
    }
    return result;
}


#pragma mark - CHCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize result = CGSizeMake(0, 0);
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height/2;
    
    if(indexPath.section == 1)
    {
        height = [self.cellHeights[indexPath.section + 1 * indexPath.item] floatValue];
        
    }
    
    result = CGSizeMake(width, height);
    
    return result;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView
didEndDisplayingSupplementaryView:(UICollectionReusableView *)view
      forElementOfKind:(NSString *)elementKind
           atIndexPath:(NSIndexPath *)indexPath
{
    LogGreen(@"hi");
}

- (void)collectionView:(UICollectionView *)collectionView
willDisplaySupplementaryView:(UICollectionReusableView *)view
        forElementKind:(NSString *)elementKind
           atIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *views = [self.cvMain indexPathsForVisibleItems];
    
    if(![views containsObject:[NSIndexPath indexPathForRow:0 inSection:0]])
    {
        [self.headerView setHidden:NO];
    }
    
    if([views containsObject:[NSIndexPath indexPathForRow:0 inSection:0]])
    {
        [self.headerView setHidden:YES];
    }
    
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSInteger result = 0;
    
    if(section == 0)
    {
        result = 1;
    }
    else
    {
        result = 30;
    }

    return result;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    
    NSInteger section = indexPath.section;
    
    switch (section)
    {
        case 0:
            cell = [self collectionView:collectionView topCellForItemAtIndexPath:indexPath];
            break;
        case 1:
            cell = [self collectionView:collectionView bottomCellForItemAtIndexPath:indexPath];
            break;
            
        default:
            break;
    }

    
    return cell;
}

- (MainPageTopCell *)collectionView:(UICollectionView *)collectionView topCellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"MainPageTopCell";
    
    MainPageTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    
    return cell;
}

- (MainPageBottomCell *)collectionView:(UICollectionView *)collectionView bottomCellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"MainPageBottomCell";
    
    MainPageBottomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    if(indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6)
    {
        cell.colorView.backgroundColor = [UIColor blackColor];
    }
    else if(indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 7)
    {
        cell.colorView.backgroundColor = [UIColor lightGrayColor];
        
    }
    else
    {
        cell.colorView.backgroundColor = [UIColor redColor];
    }
    
    LogGreen(@"sldjf : %f",indexPath.row/255.0f);
    
    cell.colorView.backgroundColor = [self randomBackgroundColor];
    
    return cell;
}

#pragma mark - Private Method

- (NSMutableArray *)cellHeights
{
    if (!_cellHeights) {
        _cellHeights = [NSMutableArray arrayWithCapacity:900];
        for (NSInteger i = 0; i < 900; i++) {
            _cellHeights[i] = @(arc4random()%100*2+100);
        }
    }
    return _cellHeights;
}


- (UIColor *)randomBackgroundColor
{
    UIColor *result = nil;
    
    CGFloat redValue = (arc4random() % 100) / 255.0f;
    CGFloat greenValue = (arc4random() % 150) / 255.0f;
    CGFloat blueValue = (arc4random() % 250) / 255.0f;
    result = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:0.7];
    
    return result;
}

-(void)setContentViewLayoutWithSubView:(UIView *)subView withTargetView:(UIView *)targetView
{
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *alcTopOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                       attribute:NSLayoutAttributeTop
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:targetView attribute:NSLayoutAttributeTop
                                                                      multiplier:1.0f
                                                                        constant:10.0f];
    
    NSLayoutConstraint *alcHeightOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                          attribute:NSLayoutAttributeHeight
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:targetView attribute:NSLayoutAttributeBottom
                                                                         multiplier:1.0f
                                                                           constant:-10.0f];
    
    NSLayoutConstraint *alcLeadingOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                           attribute:NSLayoutAttributeLeading
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:targetView attribute:NSLayoutAttributeLeading
                                                                          multiplier:1.0f
                                                                            constant:10.0f];
    
    NSLayoutConstraint *alcTrailingOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                            attribute:NSLayoutAttributeTrailing
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:targetView attribute:NSLayoutAttributeTrailing
                                                                           multiplier:1.0f
                                                                             constant:-10.0f];
    
    NSArray *cArr = @[alcTopOfSubView, alcHeightOfSubView, alcLeadingOfSubView, alcTrailingOfSubView];
    
    [targetView addConstraints:cArr];
    
}

@end
