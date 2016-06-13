//
//  SettingViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "SettingViewController.h"
#import "ShowMenuViewController.h"

#define LOG_OUT_API                                             @"http://pointapibeta.smtown.com/api/v1/accountSignOut"
@interface SettingViewController ()

@property (strong, nonatomic) ShowMenuViewController *showVC;

@property (weak, nonatomic) IBOutlet UILabel *lbUserName;
@property (weak, nonatomic) IBOutlet UILabel *lbUserId;
@property (weak, nonatomic) IBOutlet UILabel *lbChangePw;
@property (weak, nonatomic) IBOutlet UILabel *lbChangeUserInfo;
@property (weak, nonatomic) IBOutlet UILabel *lbAutoLogIn;
@property (weak, nonatomic) IBOutlet UILabel *lbCancelService;
@property (weak, nonatomic) IBOutlet UIButton *btnLogOut;

@property (weak, nonatomic) IBOutlet UIImageView *IvLine1;
@property (weak, nonatomic) IBOutlet UIImageView *IvLine2;
@property (weak, nonatomic) IBOutlet UIImageView *IvLine3;
@property (weak, nonatomic) IBOutlet UIImageView *IvLine4;
@property (weak, nonatomic) IBOutlet UIImageView *IvLine5;
@property (weak, nonatomic) IBOutlet UISwitch *swcAutoLogin;
@property (strong, nonatomic) NSDictionary *resultDic;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfUserName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLine1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbChangePw;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLine2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbChangeInfo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLine3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbAutoLogin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLine4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbRelease;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLine5;


@end

@implementation SettingViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden: YES];

    self.showVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view addSubview:self.showVC.view];
    [self.util setContentViewLayoutWithSubView2:self.showVC.view withTargetView:self.view];
    self.showVC.lbTitle.text = @"설정";
    
    self.showVC.baseVC = self;
    
    self.lbUserName.text = [self.library.userInfo userName];
    self.lbUserId.text = [self.library.userInfo userId];
    self.lbChangePw.text = @"비밀번호 변경";
    self.lbChangeUserInfo.text = @"회원정보 수정";
    self.lbAutoLogIn.text = @"자동 로그인";
    self.lbCancelService.text = @"서비스 해지";
    
    [self.btnLogOut setTitle:@"로그아웃" forState:UIControlStateNormal];
    
    [self setColorAndFont];
    [self setLayout];
    
}

#pragma mark - User Action
- (IBAction)touchedLogOut:(id)sender
{
    [self startSession];
    
}

#pragma mark - Session

-(void)startSession
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:LOG_OUT_API];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    
    NSNumber *userNo = [NSNumber numberWithInt:(int)[self.userInfo userNo]];
    NSNumber *autoLogin = [NSNumber numberWithBool:self.swcAutoLogin.isOn];
    NSLog(@"%@", autoLogin);
    NSDictionary *bodyDic = @{ @"userNo" : userNo,
                               @"deviceToken" : @"d963fcf6e9578fa44adc519287432c1b7ce176684388dabbaac0409c56873fc8",
                               @"deviceType" : @"ios",
                               @"version" : @115,
                               @"lang" : @"ko",
                               @"inPushOn" : autoLogin,
                               @"isPushDebug" : @0 };
    NSError *error;
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:bodyDic options:0 error:&error]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
     {
         id receiveData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         
         if([receiveData isKindOfClass:[NSDictionary class]])
         {
             self.resultDic = [[NSDictionary alloc]initWithDictionary:receiveData];
             NSLog(@"receive : %@", self.resultDic);
             
             NSHTTPCookieStorage *cookieStor = [NSHTTPCookieStorage sharedHTTPCookieStorage];
             NSArray *cookieArr = [cookieStor cookiesForURL:[NSURL URLWithString:LOG_OUT_API]];
             NSLog(@"%@", cookieArr)    ;
             self.library.userInfo = nil;
             
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"backToLogOutView" object:nil];
                 [self.navigationController popViewControllerAnimated:YES];

             });

             
         }
     }] resume];

}
#pragma mark - UI

-(void)setColorAndFont
{
    [self.btnLogOut setTitleColor:[self.util getColorWithRGBCode:@"ffffff"] forState:UIControlStateNormal];
    [self.btnLogOut setBackgroundColor:[self.util getColorWithRGBCode:@"f386a1"]];
    self.btnLogOut.titleLabel.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(48.0f)];
    
    self.lbUserName.font = [UIFont systemFontOfSize:WRATIO_WIDTH(58.0f)];
    self.lbUserId.font = [UIFont systemFontOfSize:WRATIO_WIDTH(45.0f)];
    self.lbChangePw.font = [UIFont systemFontOfSize:WRATIO_WIDTH(47.0f)];
    self.lbChangeUserInfo.font = [UIFont systemFontOfSize:WRATIO_WIDTH(47.0f)];
    self.lbAutoLogIn.font = [UIFont systemFontOfSize:WRATIO_WIDTH(47.0f)];
    self.lbCancelService.font = [UIFont systemFontOfSize:WRATIO_WIDTH(47.0f)];
    
    self.lbUserName.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbUserName.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbChangeUserInfo.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbChangePw.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbAutoLogIn.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbCancelService.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.IvLine1.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    self.IvLine2.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    self.IvLine3.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    self.IvLine4.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    self.IvLine5.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];

}

-(void)setLayout
{
    self.alcTopOfUserName.constant = WRATIO_WIDTH(246.0f);
    self.alcTopOfButton.constant = WRATIO_WIDTH(246.0f);
    self.alcHeightOfButton.constant = WRATIO_WIDTH(117.0f);
    self.alcWidthOfButton.constant = WRATIO_WIDTH(300.0f);
    self.alcTopOfLine1.constant = WRATIO_WIDTH(80.0f);
    self.alcTopOfLine2.constant = WRATIO_WIDTH(156.0f);
    self.alcTopOfLine3.constant = WRATIO_WIDTH(156.0f);
    self.alcTopOfLine4.constant = WRATIO_WIDTH(156.0f);
    self.alcTopOfLine5.constant = WRATIO_WIDTH(156.0f);
    self.alcTopOfLbChangePw.constant = WRATIO_WIDTH(47.0f);
    self.alcTopOfLbChangeInfo.constant = WRATIO_WIDTH(47.0f);
    self.alcTopOfLbAutoLogin.constant = WRATIO_WIDTH(47.0f);
    self.alcTopOfLbRelease.constant = WRATIO_WIDTH(47.0f);
    
}



@end
