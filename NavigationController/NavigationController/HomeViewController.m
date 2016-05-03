//
//  HomeViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "HomeViewController.h"
#import "IntroUiViewcontroller.h"
#import "UserInformation.h"
#import "LogInViewController.h"

#define DEVICE_WIDTH                                                [UIScreen mainScreen].bounds.size.width
#define QUARTER_OF_WIDTH                                            DEVICE_WIDTH/4

#define DEVICE_WIDTH                                                [UIScreen mainScreen].bounds.size.width
#define STANDARD_DEVICE_WIDTH                                       414.0f
#define WRATIO_WIDTH(w)                                             (w/3.0f) / STANDARD_DEVICE_WIDTH * DEVICE_WIDTH

@interface HomeViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *ivUser;

@property (weak, nonatomic) IBOutlet UILabel *lbAvailablePoint;
@property (weak, nonatomic) IBOutlet UILabel *lbShowPoint;
@property (weak, nonatomic) IBOutlet UILabel *lbPoint;
@property (weak, nonatomic) IBOutlet UIImageView *ivCard;
@property (weak, nonatomic) IBOutlet UILabel *lbBarCord;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopLogo;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopRight;
@property (weak, nonatomic) IBOutlet UIImageView *ivNavigationBottomColor;

@property (strong, nonatomic) IntroUiViewController *introVC;


@property (weak, nonatomic) IBOutlet UIImageView *ivMenuBottomColor;

@property (weak, nonatomic) IBOutlet UIButton *btnHome;
@property (weak, nonatomic) IBOutlet UIButton *btnPoint;
@property (weak, nonatomic) IBOutlet UIButton *btnCard;
@property (weak, nonatomic) IBOutlet UIButton *btnStore;

@property (weak, nonatomic) IBOutlet UIView *navigationContainerView;
@property (weak, nonatomic) IBOutlet UIView *menuContainerView;
@property (weak, nonatomic) IBOutlet UIView *userInfoContainerView;
@property (weak, nonatomic) IBOutlet UIView *pointContainerView;
@property (weak, nonatomic) IBOutlet UIView *labelContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *ivCenterLine;
@property (weak, nonatomic) IBOutlet UIImageView *ivMenuBottomPinkColor;
@property (weak, nonatomic) IBOutlet UIImageView *ivMiddleBell;
@property (weak, nonatomic) IBOutlet UILabel *lbMiddleNotice;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfNaviagtionBar;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfIndicator;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfHomeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfCardView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfStoreView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfIndicator;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfNoticeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfNoticeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfNoticeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfNoticeView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfUserInfoView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfUserView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfUserView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfUserView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfUsername;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMiddleLine;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfPointViewContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfAvailablePoint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfCard;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfCard;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfCard;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCard;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfMiddleBell;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMiddleBell;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfUserImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfUserImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfTopImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTopImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMenuImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfMenuImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMenuBar;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfShowPoint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfTopImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfTopMenuImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfHomeMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfPointMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCardMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfStoreMenu;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfVIP;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfVIP;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfUserName;
@property (weak, nonatomic) IBOutlet UIImageView *ivVIP;


@end

@implementation HomeViewController

typedef NS_ENUM(NSInteger, buttonTagNumber){
    buttonTagNumberHome = 1000,
    buttonTagNumberPoint,
    buttonTagNumberCard,
    buttonTagNumberStore,
};



-(void)viewDidLoad{
    [super viewDidLoad];

    self.lbUserName.text = [self.userInfomation userName];
    self.lbUserEmail.text = [self.userInfomation userId];
    self.lbAvailablePoint.text = [NSString stringWithFormat:@"%ld", (long)[self.userInfomation point]];

    
    self.introVC = [[IntroUiViewController alloc] init];
    
    self.btnHome.tag = buttonTagNumberHome;
    self.btnPoint.tag = buttonTagNumberPoint;
    self.btnCard.tag = buttonTagNumberCard;
    self.btnStore.tag = buttonTagNumberStore;

    [self.navigationController setNavigationBarHidden:YES];
    
    self.ivUser.image = [UIImage imageNamed:@"img_main_profile"];
    self.ivCard.image = [UIImage imageNamed:@"img_card_main"];
    
    self.ivTopLogo.image = [UIImage imageNamed:@"top_logo"];
    self.ivTopRight.image = [UIImage imageNamed:@"btn_menu"];

    self.ivMiddleBell.image = [UIImage imageNamed:@"icon_notice_bell"];
    self.ivVIP.image = [UIImage imageNamed:@"icon_grade_vip"];

    self.labelContainerView.layer.cornerRadius = WRATIO_WIDTH(69);
    
    self.ivUser.layer.cornerRadius = WRATIO_WIDTH(195)/2;
    self.ivUser.layer.masksToBounds = YES;
    
    [self setColor];
    [self setAutoLayout];

    
}


#pragma mark - User Touched Event

- (IBAction)touchedMenuButton:(UIButton *)sender
{
    if(sender.tag == buttonTagNumberHome)
    {
        self.alcLeadingOfIndicator.constant = QUARTER_OF_WIDTH*0;
    }
    if(sender.tag == buttonTagNumberPoint)
    {
        self.alcLeadingOfIndicator.constant = QUARTER_OF_WIDTH*1;
    }
    if(sender.tag == buttonTagNumberCard)
    {
        self.alcLeadingOfIndicator.constant = QUARTER_OF_WIDTH*2;
    }
    if(sender.tag == buttonTagNumberStore)
    {
        self.alcLeadingOfIndicator.constant = QUARTER_OF_WIDTH*3;
    }
    
}



#pragma mark - Set UI

-(void)setColor
{
    self.ivNavigationBottomColor.backgroundColor = [self.introVC getColorWithRGBCode:@"e6e6dd"];
    self.view.backgroundColor = [self.introVC getColorWithRGBCode:@"f9f9f0"];
    self.lbUserName.textColor = [self.introVC getColorWithRGBCode:@"424242"];
    self.lbUserEmail.textColor = [self.introVC getColorWithRGBCode:@"424242"];
    self.lbAvailablePoint.textColor = [self.introVC getColorWithRGBCode:@"424242"];
    self.lbShowPoint.textColor = [self.introVC getColorWithRGBCode:@"333333"];
    
    self.ivMenuBottomColor.backgroundColor = [self.introVC getColorWithRGBCode:@"e6e6dd"];
    
    self.navigationContainerView.backgroundColor = [self.introVC getColorWithRGBCode:@"ffffff"];
    self.menuContainerView.backgroundColor = [self.introVC getColorWithRGBCode:@"ffffff"];
    self.userInfoContainerView.backgroundColor = [self.introVC getColorWithRGBCode:@"f9f9f0"];
    self.pointContainerView.backgroundColor = [self.introVC getColorWithRGBCode:@"f9f9f0"];
    self.labelContainerView.backgroundColor = [self.introVC getColorWithRGBCode:@"f0f0e4"];
    self.ivCenterLine.backgroundColor = [self.introVC getColorWithRGBCode:@"f0f0e4"];
    
    self.ivMenuBottomPinkColor.backgroundColor = [self.introVC getColorWithRGBCode:@"f386a1"];
    
    self.lbMiddleNotice.textColor = [self.introVC getColorWithRGBCode:@"757575"];

}

-(void)setAutoLayout
{
    self.alcHeightOfNaviagtionBar.constant = WRATIO_WIDTH(213);
    
    self.alcWidthOfHomeView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfPointView.constant =QUARTER_OF_WIDTH;
    self.alcWidthOfCardView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfStoreView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfIndicator.constant = QUARTER_OF_WIDTH;
    
    self.alcTopOfNoticeView.constant = WRATIO_WIDTH(69);
    self.alcLeadingOfNoticeView.constant = WRATIO_WIDTH(63);
    self.alcTrailingOfNoticeView.constant = WRATIO_WIDTH(36);
    self.alcHeightOfNoticeView.constant = WRATIO_WIDTH(132);
    
    self.alcTopOfUserInfoView.constant = WRATIO_WIDTH(108);
    self.alcLeadingOfUserView.constant = WRATIO_WIDTH(36);
    self.alcHeightOfUserView.constant = WRATIO_WIDTH(366);
    self.alcWidthOfUserView.constant = WRATIO_WIDTH(579);
    
    self.alcTopOfUsername.constant = WRATIO_WIDTH(54);
    
    
    self.alcTopOfPointView.constant = WRATIO_WIDTH(108);
    self.alcTrailingOfPointView.constant = WRATIO_WIDTH(63);
    self.alcHeightOfPointView.constant =   WRATIO_WIDTH(366);
    self.alcWidthOfPointViewContainer.constant = WRATIO_WIDTH(582);
    
    self.alcTopOfAvailablePoint.constant = WRATIO_WIDTH(45);
    
    self.alcHeightOfMiddleLine.constant = WRATIO_WIDTH(366);
    
    self.alcTopOfCard.constant = WRATIO_WIDTH(129);
    self.alcLeadingOfCard.constant = WRATIO_WIDTH(39);
    self.alcTrailingOfCard.constant = WRATIO_WIDTH(39);
    
    self.alcWidthOfMiddleBell.constant = WRATIO_WIDTH(57);
    self.alcHeightOfMiddleBell.constant = WRATIO_WIDTH(63);
    
    self.alcHeightOfUserImage.constant = WRATIO_WIDTH(195);
    self.alcWidthOfUserImage.constant = WRATIO_WIDTH(195);
    
    self.alcWidthOfTopImage.constant = WRATIO_WIDTH(729);
    self.alcHeightOfTopImage.constant  = WRATIO_WIDTH(54);
    
    self.alcWidthOfMenuImage.constant = WRATIO_WIDTH(75);
    self.alcHeightOfMenuImage.constant = WRATIO_WIDTH(51);
    
    self.alcHeightOfMenuBar.constant = WRATIO_WIDTH(147);
    self.alcHeightOfHomeMenu.constant = WRATIO_WIDTH(147);
    self.alcHeightOfPointMenu.constant = WRATIO_WIDTH(147);
    self.alcHeightOfCardMenu.constant = WRATIO_WIDTH(147);
    self.alcHeightOfStoreMenu.constant = WRATIO_WIDTH(147);
    
    self.alcWidthOfVIP.constant = WRATIO_WIDTH(102);
    self.alcHeightOfVIP.constant = WRATIO_WIDTH(49);
    
    self.alcTopOfShowPoint.constant = WRATIO_WIDTH(42);
    
    self.alcBottomOfTopImage.constant = WRATIO_WIDTH(54);
    self.alcBottomOfTopMenuImage.constant = WRATIO_WIDTH(54);
    
    self.lbUserName.font = [UIFont systemFontOfSize:WRATIO_WIDTH(48)];
    self.lbUserEmail.font = [UIFont systemFontOfSize:WRATIO_WIDTH(36)];
    self.lbAvailablePoint.font = [UIFont systemFontOfSize:WRATIO_WIDTH(117)];
    self.lbShowPoint.font = [UIFont systemFontOfSize:WRATIO_WIDTH(45)];
    self.lbPoint.font = [UIFont systemFontOfSize:WRATIO_WIDTH(51)];
    
    self.lbMiddleNotice.font = [UIFont systemFontOfSize:WRATIO_WIDTH(48)];
    
    
    CGRect lbUserNameSize = [self.lbUserName.text boundingRectWithSize:self.lbUserName.frame.size options:0 attributes:@{ NSFontAttributeName:self.lbUserName.font} context:nil];
    float labelWidth = lbUserNameSize.size.width;
    
    float leadingoflbUserName = (WRATIO_WIDTH(579)- (labelWidth+1.0f+WRATIO_WIDTH(102)))/2;
    self.alcLeadingOfUserName.constant = leadingoflbUserName    ;
    
 
}


@end

