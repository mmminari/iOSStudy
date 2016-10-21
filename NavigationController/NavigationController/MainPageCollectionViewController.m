//
//  MainPageCollectionViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainPageCollectionViewController.h"
#import "MainPageTopCell.h"
#import "MainPageBottomCell.h"
#import "MainPageHeaderCell.h"
#import "FRGWaterfallCollectionViewLayout.h"


@interface MainPageCollectionViewController () < UICollectionViewDataSource, FRGWaterfallCollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *cvMain;
@property (nonatomic, strong) NSMutableArray *cellHeights;
@property (strong, nonatomic) FRGWaterfallCollectionViewLayout *waterfallLayout;

@end

@implementation MainPageCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageTopCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageTopCell"];
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageBottomCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageBottomCell"];
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageHeaderCell" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MainPageHeaderCell"];
    
    // 사용할 레이아웃,,,필요한 설정값 입력
    // 여기서 stickyHeaderView 설정
    self.waterfallLayout = [[FRGWaterfallCollectionViewLayout alloc]init];
    
    self.waterfallLayout.itemWidth = [UIScreen mainScreen].bounds.size.width/2 ;
    self.waterfallLayout.topInset = 0.0f;
    self.waterfallLayout.bottomInset = 0.0f;
    self.waterfallLayout.stickyHeader = YES;
    self.waterfallLayout.delegate = self;
    
    // 원하는 레이아웃을 해당 collectionView에 설정
    
    [self.cvMain setCollectionViewLayout:self.waterfallLayout];
    
    [self.cvMain reloadData];

    
}

#pragma mark - Header

// 해더뷰에 들어갈 cell설정
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

    
    NSAssert([kind isEqualToString:UICollectionElementKindSectionHeader], @"Unexpected supplementary element kind");
    UICollectionReusableView* cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                        withReuseIdentifier:@"MainPageHeaderCell"
                                                                               forIndexPath:indexPath];
    
    NSAssert([cell isKindOfClass:[MainPageHeaderCell class]], @"Unexpected class for header cell");
    
    MainPageHeaderCell* header_view = (MainPageHeaderCell*) cell;

    NSInteger section = indexPath.section;
    
    switch (section) {
        case 0:
            header_view.lbSection.text = @"Section 1";
            break;
        case 1:
            header_view.lbSection.text = @"Section 2";
            break;
        default:
            break;
    }
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(FRGWaterfallCollectionViewLayout *)collectionViewLayout
heightForHeaderAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger section = indexPath.section;
    
    CGFloat result = 0.0f;
    
    if(section == 1)
    {
        result = 50.0f;
    }
    return result;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(FRGWaterfallCollectionViewLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.row;
    
   // CGFloat result = 0.0f;
    
    if(section == 0)
    {
        NSLog(@"section0");
    }
    else if(section == 1)
    {
        NSLog(@"section1");
        
    }
    
    return [self.cellHeights[indexPath.section + 1 * indexPath.item] floatValue];
}

#pragma mark - UICollectionView DataSource

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
    else if(section == 1)
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
    
    // 섹션에따라 해당 셀의 width설정,,,,하려고 했으나 셀이 재사용되어 스크롤할 때 마다 레이아웃이 바뀜
    
    if(section == 0)
    {
    //    self.waterfallLayout.itemWidth = [UIScreen mainScreen].bounds.size.width ;
        self.waterfallLayout.section = 0;

    }
    else
    {
        self.waterfallLayout.section = 1;
        //self.waterfallLayout.itemWidth = [UIScreen mainScreen].bounds.size.width/2 ;

    }
    
    [self.waterfallLayout prepareLayout];
    
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



@end
