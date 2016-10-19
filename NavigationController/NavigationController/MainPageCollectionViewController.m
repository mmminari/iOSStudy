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



@interface MainPageCollectionViewController () < UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *cvMain;

@end

@implementation MainPageCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageTopCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageTopCell"];
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageBottomCell" bundle:nil] forCellWithReuseIdentifier:@"MainPageBottomCell"];
    [self.cvMain registerNib:[UINib nibWithNibName:@"MainPageHeaderCell" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MainPageHeaderCell"];
    
}

#pragma mark - Header

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize result = CGSizeMake(0, 0);
    
    if(section == 1)
    {
        result = CGSizeMake(0, 50);
    }
    
    return result;
}

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

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height/2;
    
    return CGSizeMake(width, height);
    
}

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
        result = 3;
    }
    
    return result;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    
    NSInteger row = indexPath.section;
    
    switch (row) {
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
    
    if(indexPath.row == 0 || indexPath.row == 2)
    {
        cell.colorView.backgroundColor = [UIColor blackColor];
    }
    else if(indexPath.row == 1)
    {
        cell.colorView.backgroundColor = [UIColor lightGrayColor];
    }
    
    return cell;
}


@end
