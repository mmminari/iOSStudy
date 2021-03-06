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
#import "ShowMenuViewController.h"

#import "MenuEventViewController.h"
#import "MenuNoticeViewController.h"
#import "MenuCustomerCenterViewController.h"
#import "MenuAgreementViewController.h"
#import "MenuUserInfoViewController.h"

#import "SettingViewController.h"
#import "MenuWebViewController.h"

#import "SplashViewController.h"
#import "LogOutCollectionViewController.h"
#import "IntroInformation.h"

@interface MainViewController ()

@property (strong, nonatomic) HomeViewController *HomeVC;
@property (strong, nonatomic) PointViewController *pointVC;
@property (strong, nonatomic) CardViewController *cardVC;
@property (strong, nonatomic) StoreViewController *storeVC;
@property (strong, nonatomic) MenuViewController *menuVC;
@property (strong, nonatomic) ShowMenuViewController *showVC;
@property (strong, nonatomic) SettingViewController *settingVC;
@property (strong, nonatomic) SplashViewController *splashVC;
@property (strong, nonatomic) LogOutCollectionViewController *logoutVC;
@property (strong, nonatomic) LogInViewController *LoginVC;

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


@property (assign,nonatomic) NSInteger index2;

@property (weak, nonatomic) IBOutlet UIView *mainViewContainer;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfNavi;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfTapBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfCollection;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfBtnHome;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfIndic;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcCenterOfIvMain;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfMainView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfMainView;

@property (weak, nonatomic) IBOutlet UIImageView *ivBarBottomCor;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMainImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfMainImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfMenuImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMenuImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfMainImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfMenuImg;
@property (weak, nonatomic) IBOutlet UIView *hideView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfHideView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfHideView;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;


@property (strong, nonatomic) NSNotificationCenter *notiCenter;
@property (assign, nonatomic) BOOL flag;
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
    
    //side menu show시 화면을 까맣게 보여주는 view
    [self.hideView setHidden:YES];
    self.hideView.backgroundColor = [UIColor blackColor];
    self.hideView.alpha = 0.5f;
    
    self.btnHome.tag = ButtonTagNumberHome;
    self.btnPoint.tag = ButtonTagNumberPoint;
    self.btnCard.tag = ButtonTagNumberCard;
    self.btnStore.tag = ButtonTagNumberStore;
    
    self.flag = YES;
    
    //처음 뷰가 로드 될 때 스토리보드도 로드가 된다. 각 스토리보드에 id값을 주어 각각의 컨트롤러와 연결해줌으로써 뷰를 사용할 수 있다.
    self.logoutVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-logoutcollection"];
    self.HomeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-mainhomeview"];
    self.pointVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-mainpointview"];
    self.cardVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-maincardview"];
    self.storeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-mainstoreview"];
    self.menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-menuview"];
    self.settingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-settingView"];
    self.LoginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-logInView"];
    
    self.splashVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-splash"];
    [self.view addSubview:self.splashVC.view];
    [self.util setContentViewLayoutWithSubView:self.splashVC.view withTargetView:self.view];
    
    //스플래시 화면이 떠있는 상태에서 자동로그인 여부로 login화면으로 갈지 logout화면으로 갈지 판별
    if(![self getResultOfAutoSignIn])
    {
        [self.mainViewContainer addSubview:self.logoutVC.view];
        [self.util setContentViewLayoutWithSubView3:self.logoutVC.view withTargetView:self.mainViewContainer];
    }
    
    self.cardVC.userInfo = self.userInfo;
    self.menuVC.userInfo = self.userInfo;
    self.menuVC.mainVC = self;
    self.cardVC.mainVC = self;
    self.HomeVC.mainInfo = self.mainInfo;
    self.settingVC.userInfo = self.userInfo;
    self.HomeVC.mainVC = self;
    self.storeVC.mainVC = self;
    
    //addsubview가 된 뷰에서 화면을 띄우거나 다른 화면으로 전환할 때 메인컨트롤러를 넘겨주어 서브뷰에서도 화면전환을 할 수 있다.
    //서브뷰에서 다른뷰로 정보를 넘길때 필요한 코드는 메인뷰의 prepareForSegue로
    
    [self.view addSubview:self.menuVC.view];
    [self.view sendSubviewToBack:self.menuVC.view];
    // [self.view insertSubview:self.menuVC.view atIndex:0];
    //뷰의 계층관계에서 제일 위나 밑은 index값으로 넣기보다는 back이나 front로 넣는게 좋
    
    [self.util setContentViewLayoutWithSubView:self.menuVC.view withTargetView:self.view];
    [self setLayoutAndColor];
    
    LogRed(@"launchOption : %@", [NSNumber numberWithBool: self.library.launchOption]);
    if(self.library.launchOption)
    {
        [self setContentOffset];
    }
    
}

-(void)setContentOffset
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.cvMainView reloadData];
        [self.cvMainView setContentOffset:CGPointMake(DEVICE_WIDTH,0.0f) animated:YES];
        [self setLeadingOfPinkIndicatorWithIndex:1];
        
        LogRed(@"reloadColletionViews");
        
    });
}


#pragma mark - NotificationCenter

-(void)viewWillAppear:(BOOL)animated
{
    if(self.flag)
    {
        NSLog(@"will appear");
        //NSNotificationCenter을 사용하여 통신이 끝난 후 데이터를 넘겨줌
        self.notiCenter = [NSNotificationCenter defaultCenter];
        [self.notiCenter addObserver:self selector:@selector(sendData:) name:@"endDataTransit" object:nil];
        [self.notiCenter addObserver:self selector:@selector(reloadColletionViews:) name:@"endUserInfoTransit" object:nil];
        [self.notiCenter addObserver:self selector:@selector(backToLogInView:) name:@"backToLogInView" object:nil];
        [self.notiCenter addObserver:self selector:@selector(backToLogOutView:) name:@"backToLogOutView" object:nil];
        [self.notiCenter addObserver:self selector:@selector(moveToPointView:) name:@"moveToPointView" object:nil];
        [self.notiCenter addObserver:self selector:@selector(reloadUserProfile:) name:@"reloadUserProfile" object:nil];
        LogBlue(@"noti");
        
    }
    
    self.flag = NO;
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    //    [self.notiCenter removeObserver:self];
}

-(void)reloadUserProfile:(NSNotification *)noti
{
    [self.splashVC reqUserInformation];
}

-(void)moveToPointView:(NSNotification *)noti
{
    [self showViewController:self sender:nil];
    [self.cvMainView setContentOffset:CGPointMake(DEVICE_WIDTH*1,0.0f) animated:YES];
    
    LogRed(@"moveToPointView");
    
}

-(void)sendData:(NSNotification *)notification
{
    LogYellow(@"send");
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.cvMainView reloadData];
        
        [self.splashVC.view removeFromSuperview];
        [self.splashVC removeFromParentViewController];
        self.logoutVC.introList = self.library.mainInfo.introList;
        
        [self.logoutVC.cvLogOut reloadData];
    });
}

-(void)reloadColletionViews:(NSNotification *)noti
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.cvMainView reloadData];
        [self.menuVC viewWillAppear:YES];
        LogRed(@"reloadColletionViews");
        
    });
}

-(void)backToLogInView:(NSNotification *)noti
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.logoutVC.view setHidden:YES];
        [self.menuVC setMenuLogInLayOut];
        [self.cvMainView reloadData];
    });
}

-(void)backToLogOutView:(NSNotification *)noti
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.logoutVC.view setHidden:NO];
        [self.menuVC setMenuLogOutLayOut];
        [self.cvMainView reloadData];
        
    });
}

#pragma mark - UI

-(void)setLayoutAndColor
{
    self.alcHeightOfNaviagtionBar.constant = WRATIO_WIDTH(213);
    
    self.alcWidthOfHomeView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfPointView.constant = QUARTER_OF_WIDTH;
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
    self.ivBarBottomCor.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    
    self.alcHeightOfMainImg.constant = WRATIO_WIDTH(48.0f);
    self.alcWidthOfMainImg.constant = WRATIO_WIDTH(729.0f);
    self.alcHeightOfMenuImg.constant = WRATIO_WIDTH(51.0f);
    self.alcWidthOfMenuImg.constant = WRATIO_WIDTH(75.0f);
    self.alcBottomOfMainImg.constant = WRATIO_WIDTH(54.0f);
    self.alcBottomOfMenuImg.constant = WRATIO_WIDTH(54.0f);
}

#pragma mark - User Action

- (IBAction)touchedMenuButton:(UIButton *)sender
{
    NSInteger index = sender.tag - 1000;
    
    //사용자 버튼 중복터치 방지
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

- (IBAction)touchedBackToMain:(id)sender
{
    self.alcTrailingOfMainView.constant = 0.0f;
    self.alcLeadingOfMainView.constant  = 0.0f;
    
    [self.hideView setHidden:YES];
    [self setAnimation];
    
}

- (IBAction)touchedBarMenu:(id)sender
{
    self.alcLeadingOfMainView.constant = - WRATIO_WIDTH(REMAIN_SPACE);
    self.alcTrailingOfMainView.constant = WRATIO_WIDTH(REMAIN_SPACE);
    
    [self.hideView setHidden:NO];
    [self.mainViewContainer bringSubviewToFront:self.hideView];
    [self setAnimation];
}

-(void)setAnimation
{
    NSTimeInterval animationDuration = 0.3f;
    
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0.0f options:animationOptions animations:^{
        
        [self.view layoutIfNeeded];
        
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
        [self.util setContentViewLayoutWithSubView:self.HomeVC.view withTargetView:cell.contentView];
        [self.HomeVC viewWillAppear:YES];
        //각각의 viewcontroller을 subview로 추가해주었기 때문에 업데이트할 속성들을 따로 오버라이딩 하여 호출해주어야 reload됨
    }
    if(indexPath.item == 1)
    {
        [cell.contentView addSubview:self.pointVC.view];
        [self.util setContentViewLayoutWithSubView:self.pointVC.view withTargetView:cell.contentView];
    }
    if(indexPath.item == 2)
    {
        [cell.contentView addSubview:self.cardVC.view];
        self.cardVC.mainVC = self;
        [self.util setContentViewLayoutWithSubView:self.cardVC.view withTargetView:cell.contentView];
        [self.cardVC viewWillAppear:YES];
    }
    if(indexPath.item == 3)
    {
        [cell.contentView addSubview:self.storeVC.view];
        [self.util setContentViewLayoutWithSubView:self.storeVC.view withTargetView:cell.contentView];
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
    [self setAnimation];
    
}

-(void)setContentViewLayoutWithSubView:(UIView *)subView withTargetView:(UIView *)targetView
{
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *alcTopOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                       attribute:NSLayoutAttributeTop
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:targetView attribute:NSLayoutAttributeTop
                                                                      multiplier:1.0f
                                                                        constant:-20.0f];
    
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

//segue를 사용하지 않고 storyboardId를 이용해서 뷰 전환
-(void)moveToTheTargetViewWithStid:(NSString *)stid MenuList:(MenuList)list
{
    BaseViewController *baseVC = nil;
    //baseVC라는 부모클래스에 자식을 담아두기위함
    if([stid isEqualToString:@"stid-event"])
    {
        MenuEventViewController *eventVC = [self.storyboard instantiateViewControllerWithIdentifier:stid];
        baseVC = eventVC;
        
    }
    if([stid isEqualToString:@"stid-notice"])
    {
        MenuNoticeViewController *notiVC = [self.storyboard instantiateViewControllerWithIdentifier:stid];
        baseVC = notiVC;
    }
    if([stid isEqualToString:@"stid-cuscenter"])
    {
        MenuCustomerCenterViewController *custVC = [self.storyboard instantiateViewControllerWithIdentifier:stid];
        baseVC = custVC;
    }
    if([stid isEqualToString:@"stid-agreement"])
    {
        MenuAgreementViewController *agreeVC = [self.storyboard instantiateViewControllerWithIdentifier:stid];
        baseVC = agreeVC;
    }
    if([stid isEqualToString:@"stid-userinfo"])
    {
        MenuUserInfoViewController *userVC = [self.storyboard instantiateViewControllerWithIdentifier:stid];
        baseVC = userVC;
    }
    
    [baseVC setTitleOfNavibarWithMenuList:list];
    [baseVC setWebViewWithMenuList:list];
    [self.navigationController pushViewController:baseVC animated:YES]; //segue를 사용하지 않고 뷰 전환 (push)
    
}

-(void)moveToTheTargetViewWithMenuList:(MenuList)list
{
    BaseViewController *baseVC = nil;
    MenuWebViewController *webVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-menuWebView"];
    
    baseVC = webVC;
    [baseVC setTitleOfNavibarWithMenuList:list];
    [baseVC setWebViewWithMenuList:list];
    [self.navigationController pushViewController:baseVC animated:YES];
    
}



/*
 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if([[segue identifier] isEqualToString:@"sgMainToBarcode"])
 {
 BarcodeViewController *barcVC = [segue destinationViewController];
 barcVC.barString = [self.userInfo cardNo];
 }
 if([[segue identifier] isEqualToString:@"sgMenuToSetting"])
 {
 SettingViewController *settingVC = [segue destinationViewController];
 settingVC.userInfo = self.userInfo;
 }
 
 }
 */


@end
