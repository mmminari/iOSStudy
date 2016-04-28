//
//  HomeViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "HomeViewController.h"



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

@end




@implementation HomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:YES];
    
    self.ivUser.image = [UIImage imageNamed:@"img_main_profile"];
    self.ivCard.image = [UIImage imageNamed:@"img_card_main"];
    
    self.lbUserName = [[self.userInfoDic objectForKey:@"userInfo"] objectForKey:@"userName"];
    self.lbUserEmail = [[self.userInfoDic objectForKey:@"userInfo"] objectForKey:@"userId"];
    self.lbPoint = [[self.userInfoDic objectForKey:@"pointInfo"] objectForKey:@"point"];
    
    self.ivTopLogo.image = [UIImage imageNamed:@"top_logo"];
    self.ivTopRight.image = [UIImage imageNamed:@"btn_menu"];
    
    
    
    
 
    
}



@end

