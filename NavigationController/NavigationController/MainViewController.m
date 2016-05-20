//
//  MainViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainViewController.h"
#import "MainCollectionCell.h"

#import "HomeViewController.h"
#import "PointViewController.h"
#import "CardViewController.h"
#import "StoreViewController.h"

#import "BarcodeViewController.h"


@interface MainViewController ()

@property (strong, nonatomic) HomeViewController *HomeVC;
@property (strong, nonatomic) PointViewController *pointVC;
@property (strong, nonatomic) CardViewController *cardVC;
@property (strong, nonatomic) StoreViewController *storeVC;

@property (weak, nonatomic) IBOutlet UIView *navigationView;
@property (weak, nonatomic) IBOutlet UIImageView *ivNavigationLogo;
@property (weak, nonatomic) IBOutlet UIImageView *ivNavigationMenu;
@property (weak, nonatomic) IBOutlet UIView *tapBarView;
@property (weak, nonatomic) IBOutlet UIView *barHomeView;
@property (weak, nonatomic) IBOutlet UIView *barPointView;
@property (weak, nonatomic) IBOutlet UIView *barCardView;
@property (weak, nonatomic) IBOutlet UIView *barStoreView;

@property (weak, nonatomic) IBOutlet UIImageView *ivBarBottom;
@property (weak, nonatomic) IBOutlet UIImageView *ivPinkIndicator;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfHomeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfCardView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfStoreView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfIndicator;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfNaviagtionBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfIndicator;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMenuBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfNaviBar;

@property (weak, nonatomic) IBOutlet UIButton *btnHome;
@property (weak, nonatomic) IBOutlet UIButton *btnPoint;
@property (weak, nonatomic) IBOutlet UIButton *btnCard;
@property (weak, nonatomic) IBOutlet UIButton *btnStore;

@property (weak, nonatomic) IBOutlet UICollectionView *cvMainView;

@property (assign,nonatomic) NSInteger index2;



@end

@implementation MainViewController

typedef NS_ENUM(NSInteger, ButtonTagNumber){
    ButtonTagNumberHome = 1000,
    ButtonTagNumberPoint,
    ButtonTagNumberCard,
    ButtonTagNumberStore,
};

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.HomeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-mainhomeview"];
    self.pointVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-mainpointview"];
    self.cardVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-maincardview"];
    self.storeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-mainstoreview"];
    
    self.HomeVC.userInfomation   = self.userInfo;
    self.cardVC.userInfo = self.userInfo;

    self.btnHome.tag = ButtonTagNumberHome;
    self.btnPoint.tag = ButtonTagNumberPoint;
    self.btnCard.tag = ButtonTagNumberCard;
    self.btnStore.tag = ButtonTagNumberStore;
    
    self.alcHeightOfNaviagtionBar.constant = WRATIO_WIDTH(213);
    
    self.alcWidthOfHomeView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfPointView.constant =QUARTER_OF_WIDTH;
    self.alcWidthOfCardView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfStoreView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfIndicator.constant = QUARTER_OF_WIDTH;
    
    self.ivNavigationLogo.image = [UIImage imageNamed:@"top_logo"];
    self.ivNavigationMenu.image = [UIImage imageNamed:@"btn_menu"];
    
    self.ivBarBottom.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    self.navigationView.backgroundColor = [self.util getColorWithRGBCode:@"ffffff"];
    self.tapBarView.backgroundColor = [self.util getColorWithRGBCode:@"ffffff"];
    
    self.ivPinkIndicator.backgroundColor = [self.util getColorWithRGBCode:@"f386a1"];
    self.ivBarBottom.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    
    
}

#pragma mark - User Action

- (IBAction)touchedMenuButton:(UIButton *)sender
{

     NSInteger index = sender.tag - 1000;

    if(index != self.index2)
    {
        [self.cvMainView setContentOffset:CGPointMake(DEVICE_WIDTH*index,0.0f) animated:YES];
    }
    
    [self setLeadingOfPinkIndicatorWithIndex:index];

    if(sender.tag == ButtonTagNumberPoint)
    {
        [self reloadWkWebView];
    }
    
    self.index2 = index;

}

- (void)touchedShowBarcode
{
   
    NSString *sgId = @"sgMainToBarcode";
    [self performSegueWithIdentifier:sgId sender:self];
    
}


#pragma mark - Collection View

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height-self.alcHeightOfMenuBar.constant-self.alcHeightOfNaviBar.constant - 1.0f ;
    
    return CGSizeMake(width, height);
    
}

/*
-(void)setUserMultiTouchUnenablewithCollectionView:(UICollectionView *)collectionView withIndex:(NSInteger)index
{
    CGFloat width = collectionView.contentOffset.x / DEVICE_WIDTH;
    
    if(width == 0.0f || width == 1.0f || width == 2.0f || width == 3.0f)
    {
        [self.cvMainView setContentOffset:CGPointMake(DEVICE_WIDTH*index,0.0f) animated:YES];
    }

}
*/


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"mainCollectionCell";
    
    MainCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    if(indexPath.item == 0)
    {
        [cell.contentView addSubview:self.HomeVC.view];
        [self setContentViewLayoutWithSubView:self.HomeVC.view withTargetView:cell.contentView];
        
    }
    if(indexPath.item == 1)
    {
        [cell.contentView addSubview:self.pointVC.view];
        [self setContentViewLayoutWithSubView:self.pointVC.view withTargetView:cell.contentView];
        
    }
    if(indexPath.item == 2)
    {
        [cell.contentView addSubview:self.cardVC.view];
        self.cardVC.mainVC = self;

        [self setContentViewLayoutWithSubView:self.cardVC.view withTargetView:cell.contentView];
        
        
    }
    if(indexPath.item == 3)
    {
        [cell.contentView addSubview:self.storeVC.view];
        [self setContentViewLayoutWithSubView:self.storeVC.view withTargetView:cell.contentView];
        
    }

    return cell;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger index = self.cvMainView.contentOffset.x / DEVICE_WIDTH;
    [self setLeadingOfPinkIndicatorWithIndex:index];
    
    [self reloadWkWebView];
}


-(void)reloadWkWebView
{
    [self.pointVC.wkWebView reload];
    
    if(self.pointVC.wkWebView.loading)
    {
        [self.pointVC.activityIndic startAnimating];
    }
}


#pragma mark - set layout

-(void)setSwipeAnimationWithIndex:(NSInteger)index
{
    self.cvMainView.contentOffset = CGPointMake(DEVICE_WIDTH*index,0.0f);

    NSTimeInterval animationDuration = 0.3f;
    
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0.0f options:animationOptions animations:^{
        [self.cvMainView layoutIfNeeded];
    } completion:nil];

}

- (void)setContentOffset:(CGPoint)contentOffset
                animated:(BOOL)animated
{
    self.cvMainView.contentOffset = contentOffset;
    
    NSTimeInterval animationDuration = 0.3f;
    
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0.0f options:animationOptions animations:^{
        [self.cvMainView layoutIfNeeded];
        
    } completion:nil];
    
}

-(void)setLeadingOfPinkIndicatorWithIndex:(NSInteger)index
{
    self.alcLeadingOfIndicator.constant = QUARTER_OF_WIDTH * index;
    
    NSTimeInterval animationDuration = 0.3f;
    
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0.0f options:animationOptions animations:^{
        [self.view layoutIfNeeded];
        
    } completion:nil];
    
}

-(void)setContentViewLayoutWithSubView:(UIView *)subView withTargetView:(UIView *)targetView
{
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *alcTopOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                       attribute:NSLayoutAttributeTop
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:targetView attribute:NSLayoutAttributeTop
                                                                      multiplier:1.0f
                                                                        constant:0.0f];
    
    NSLayoutConstraint *alcBottomOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                          attribute:NSLayoutAttributeBottom
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:targetView attribute:NSLayoutAttributeBottom
                                                                         multiplier:1.0f
                                                                           constant:0.0f];
    
    NSLayoutConstraint *alcLeadingOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                           attribute:NSLayoutAttributeLeading
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:targetView attribute:NSLayoutAttributeLeading
                                                                          multiplier:1.0f
                                                                            constant:0.0f];
    
    NSLayoutConstraint *alcTrailingOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                            attribute:NSLayoutAttributeTrailing
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:targetView attribute:NSLayoutAttributeTrailing
                                                                           multiplier:1.0f
                                                                             constant:0.0f];
    
    NSArray *cArr = @[alcTopOfSubView, alcBottomOfSubView, alcLeadingOfSubView, alcTrailingOfSubView];
    
    [targetView addConstraints:cArr];

    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"sgMainToBarcode"])
    {
        BarcodeViewController *barcVC = [segue destinationViewController];
        barcVC.barString = [self.userInfo cardNo];
        
    }
}






@end
