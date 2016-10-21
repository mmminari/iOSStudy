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
@property (nonatomic, strong) NSMutableArray *cellHeights;



@end

@implementation FBWaterfallLayoutViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageTopCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageTopCell"];
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageBottomCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageBottomCell"];
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageHeaderCell" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MainPageHeaderCell"];
    
    CHTCollectionViewWaterfallLayout *waterfallLayout = [[CHTCollectionViewWaterfallLayout alloc]init];
    
    waterfallLayout.headerHeight = 10.0f;
    [waterfallLayout registerNib:[UINib nibWithNibName:@"MainPageHeaderCell" bundle:nil]  forDecorationViewOfKind:@"MainPageHeaderCell"];
    
    
    [self.cvMain setCollectionViewLayout:waterfallLayout];
    
    
}


#pragma mark - HeaderView

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
                   layout:(UICollectionViewLayout *)collectionViewLayout
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


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(100, 100);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
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

#pragma mark <UICollectionViewDataSource>

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

@end
