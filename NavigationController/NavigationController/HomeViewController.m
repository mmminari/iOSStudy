//
//  HomeViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "HomeViewController.h"
#import "IntroUiViewcontroller.h"


@interface HomeViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *ivUser;
@property (weak, nonatomic) IBOutlet UILabel *lbUserName;
@property (weak, nonatomic) IBOutlet UILabel *lbUserEmail;

@property (weak, nonatomic) IBOutlet UILabel *lbAvailablePoint;
@property (weak, nonatomic) IBOutlet UILabel *lbShowPoint;
@property (weak, nonatomic) IBOutlet UILabel *lbPoint;
@property (weak, nonatomic) IBOutlet UIImageView *ivCard;
@property (weak, nonatomic) IBOutlet UILabel *lbBarCord;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopLogo;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopRight;
@property (weak, nonatomic) IBOutlet UIImageView *ivNavigationBottomColor;
@property (strong, nonatomic) IntroUiViewController *IntroVC;
@property (weak, nonatomic) IBOutlet UIImageView *ivMenuBottomColor;

@property (weak, nonatomic) IBOutlet UIView *navigationContainerView;
@property (weak, nonatomic) IBOutlet UIView *menuContainerView;
@property (weak, nonatomic) IBOutlet UIView *userInfoContainerView;
@property (weak, nonatomic) IBOutlet UIView *pointContainerView;
@property (weak, nonatomic) IBOutlet UIView *labelContainerView;


@end




@implementation HomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.IntroVC = [[IntroUiViewController alloc] init];
    

    [self.navigationController setNavigationBarHidden:YES];
    
    self.ivUser.image = [UIImage imageNamed:@"img_main_profile"];
    self.ivCard.image = [UIImage imageNamed:@"img_card_main"];
    
    self.lbUserName = [[self.userInfoDic objectForKey:@"userInfo"] objectForKey:@"userName"];
    self.lbUserEmail = [[self.userInfoDic objectForKey:@"userInfo"] objectForKey:@"userId"];
    self.lbPoint = [[self.userInfoDic objectForKey:@"pointInfo"] objectForKey:@"point"];
    
    self.ivTopLogo.image = [UIImage imageNamed:@"top_logo"];
    self.ivTopRight.image = [UIImage imageNamed:@"btn_menu"];

    [self setColor];
    
    
}

-(void)setColor
{
    self.ivNavigationBottomColor.backgroundColor = [self.IntroVC getColorWithRGBCode:@"e6e6dd"];
    self.view.backgroundColor = [self.IntroVC getColorWithRGBCode:@"f9f9f0"];
    self.lbUserName.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    self.lbUserEmail.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    self.lbAvailablePoint.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    self.lbShowPoint.textColor = [self.IntroVC getColorWithRGBCode:@"333333"];
    
    self.ivMenuBottomColor.backgroundColor = [self.IntroVC getColorWithRGBCode:@"e6e6dd"];
    
    self.navigationContainerView.backgroundColor = [self.IntroVC getColorWithRGBCode:@"ffffff"];
    self.menuContainerView.backgroundColor = [self.IntroVC getColorWithRGBCode:@"ffffff"];
    self.userInfoContainerView.backgroundColor = [self.IntroVC getColorWithRGBCode:@"f9f9f0"];
    self.pointContainerView.backgroundColor = [self.IntroVC getColorWithRGBCode:@"f9f9f0"];
    self.labelContainerView.backgroundColor = [self.IntroVC getColorWithRGBCode:@"f0f0e4"];
    
    
    
}


@end

