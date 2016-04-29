//
//  HomeViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "HomeViewController.h"
#import "IntroUiViewcontroller.h"

#define DEVICE_WIDTH                                            [UIScreen mainScreen].bounds.size.width
#define QUARTER_OF_WIDTH                                        DEVICE_WIDTH/4

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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfIndicator;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfHomeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfCardView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfStoreView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfIndicator;

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

    [self setColor];
    [self setAutoLayout];
    
    self.labelContainerView.layer.cornerRadius = 23.0f;
    
    self.ivMiddleBell.image = [UIImage imageNamed:@"icon_notice_bell"];
    
    self.ivUser.layer.cornerRadius = 32.5f;
    self.ivUser.layer.masksToBounds = YES;
    
    
    
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
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.alcWidthOfHomeView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfPointView.constant =QUARTER_OF_WIDTH;
    self.alcWidthOfCardView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfStoreView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfIndicator.constant = QUARTER_OF_WIDTH;
    
    
}


@end

