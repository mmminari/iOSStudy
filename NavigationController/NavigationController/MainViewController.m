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
#import "MenuViewController.h"


#define REMAIN_SPACE                                            414.0f - 353.0f

@interface MainViewController ()

@property (strong, nonatomic) HomeViewController *HomeVC;
@property (strong, nonatomic) PointViewController *pointVC;
@property (strong, nonatomic) CardViewController *cardVC;
@property (strong, nonatomic) StoreViewController *storeVC;
@property (strong, nonatomic) MenuViewController *menuVC;

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


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfNavi;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfTapBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfCollection;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfBtnHome;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfIndic;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcCenterOfIvMain;

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
    
    self.menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-menuview"];
    
    self.HomeVC.userInfomation   = self.userInfo;
    self.cardVC.userInfo = self.userInfo;
    self.menuVC.userInfo = self.userInfo;
    

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
    
    [self.view addSubview:self.menuVC.view];
    [self.view sendSubviewToBack:self.menuVC.view];
   // [self.view insertSubview:self.menuVC.view atIndex:0];
    
    //[self.view insertSubview:self.menuVC.view belowSubview:self.view];

    [self setContentViewLayoutWithSubView:self.menuVC.view withTargetView:self.view];
    
    
    
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

- (IBAction)touchedBarMenu:(id)sender {

    NSTimeInterval animationDuration = 0.5f;
    
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0.0f options:animationOptions animations:^{

        if(self.view.frame.origin.x == 0.0f)
        {
            CGRect frame = CGRectMake( - WRATIO_WIDTH(REMAIN_SPACE), 0, DEVICE_WIDTH, DEVICE_HEIGHT);
            self.view.frame = frame;
            CGRect menuFrame = CGRectMake( WRATIO_WIDTH(REMAIN_SPACE), 0, DEVICE_WIDTH*100, DEVICE_HEIGHT);
            self.menuVC.view.frame = menuFrame;
        }
        else
        {
            CGRect frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT);
            self.view.frame = frame;
        }

    } completion:nil];

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
