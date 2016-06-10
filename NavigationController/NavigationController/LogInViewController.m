//
//  LogInViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "LogInViewController.h"
#import "IntroUiViewController.h"
#import "HomeViewController.h"
#import "MainViewController.h"

@interface LogInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfPassWord;
@property (weak, nonatomic) IBOutlet UILabel *lbEmail;
@property (weak, nonatomic) IBOutlet UILabel *lbPassWord;
@property (weak, nonatomic) IBOutlet UILabel *lbAutoLogIn;
@property (weak, nonatomic) IBOutlet UIButton *btnLogIn;
@property (weak, nonatomic) IBOutlet UIButton *btnFindInfo;
@property (weak, nonatomic) IBOutlet UILabel *lbBottom;
@property (weak, nonatomic) IBOutlet UISwitch *swcAutoLogIn;
@property (weak, nonatomic) IBOutlet UILabel *lbURL;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfTopLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbEmail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfTfEmail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbPassword;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfTfPassword;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbAutoLogIn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfBtnLogIn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfBtnFindInfo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbBottom;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTfEmail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTfPassword;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfBtnLogIn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfBtnFindInfo;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfNavigationBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfTopLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfTopLeftImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTopLeftImage;

@property (strong, nonatomic) NSDictionary *sentDataDic;

@property (weak, nonatomic) IBOutlet UIImageView *ivButton;
@property (weak, nonatomic) IBOutlet UILabel *lbLogInInfo;
@property (weak, nonatomic) IBOutlet UIImageView *ivNavigationBottomColor;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopLine;
@property (weak, nonatomic) IBOutlet UIImageView *ivBtnTopLine;
@property (weak, nonatomic) IBOutlet UIImageView *ivBtnBottomLine;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottmIcon;
@property (weak, nonatomic) IBOutlet UIImageView *ivGoButton;

@property (weak, nonatomic) NSString *receivedUserName;
@property (assign, nonatomic) NSInteger receivedUserPoint;

@end


@implementation LogInViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tfEmail.text = @"yonghwinam@smtown.com";
    self.tfPassWord.text = @"apple0000";
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.lbLogInInfo.text = @"로그인 정보";
    self.ivButton.image = [UIImage imageNamed:@"btn_back"];
    self.ivBottmIcon.image = [UIImage imageNamed:@"icon_info"];
    self.ivGoButton.image = [UIImage imageNamed:@"btn_menu_go"];
    
    [self setColor];
    [self setAutoLayout];
    
    NSString *urlString = @"http://membership.smtown.com/";
    NSMutableAttributedString *mutableUrlString = [[NSMutableAttributedString alloc]initWithString:urlString];
    
    [mutableUrlString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, urlString.length)];
    
    self.lbURL.attributedText = mutableUrlString;
    
}

#pragma mark - User Touched Event

- (IBAction)touchedLogIn:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [self startSession];
    [self setResultOfAutoSignInWithSwith:self.swcAutoLogIn];
}

- (IBAction)touchedURLStringToSafari:(id)sender
{
     NSString *urlString = @"http://membership.smtown.com/";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

- (IBAction)touchedGoBack:(id)sender
{
    //show로 연결했을 때 뒤로가는 버튼
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Set UI
-(void)setAutoLayout
{
    self.alcTopOfTopLine.constant = WRATIO_WIDTH(78);
    self.alcTopOfLbEmail.constant = WRATIO_WIDTH(57);
    self.alcTopOfTfEmail.constant = WRATIO_WIDTH(51);
    self.alcTopOfLbPassword.constant = WRATIO_WIDTH(78);
    self.alcTopOfTfPassword.constant = WRATIO_WIDTH(51);
    self.alcTopOfLbAutoLogIn.constant = WRATIO_WIDTH(60);
    self.alcTopOfBtnLogIn.constant = WRATIO_WIDTH(78);
    self.alcTopOfBtnFindInfo.constant = WRATIO_WIDTH(75);
    self.alcTopOfLbBottom.constant = WRATIO_WIDTH(75);
    
    self.alcHeightOfTfEmail.constant = WRATIO_WIDTH(105);
    self.alcHeightOfTfPassword.constant = WRATIO_WIDTH(105);
    self.alcHeightOfBtnLogIn.constant = WRATIO_WIDTH(120);
    self.alcHeightOfBtnFindInfo.constant = WRATIO_WIDTH(156);
    
    self.lbEmail.font = [UIFont systemFontOfSize:WRATIO_WIDTH(48)];
    self.lbPassWord.font = [UIFont systemFontOfSize:WRATIO_WIDTH(46)];
    self.lbAutoLogIn.font = [UIFont systemFontOfSize:WRATIO_WIDTH(46)];
    self.lbBottom.font = [UIFont systemFontOfSize:WRATIO_WIDTH(36)];
    
    self.btnLogIn.titleLabel.font = [UIFont systemFontOfSize:WRATIO_WIDTH(48)];
    self.btnFindInfo.titleLabel.font = [UIFont systemFontOfSize:WRATIO_WIDTH(51)];
    
    self.lbLogInInfo.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(54)];
    self.alcBottomOfTopLeftImage.constant = WRATIO_WIDTH(54);
    self.alcHeightOfTopLeftImage.constant = WRATIO_WIDTH(63);
    
    self.alcHeightOfNavigationBar.constant = WRATIO_WIDTH(213);
    self.alcBottomOfTopLabel.constant = WRATIO_WIDTH(54);
    
    float screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    if(screenHeight == 480)
    {
        self.alcTopOfTopLine.constant = HRATIO_HEIGHT(78);
        self.alcTopOfLbEmail.constant = HRATIO_HEIGHT(57);
        self.alcTopOfTfEmail.constant = HRATIO_HEIGHT(51);
        self.alcTopOfLbPassword.constant = HRATIO_HEIGHT(78);
        self.alcTopOfTfPassword.constant = HRATIO_HEIGHT(51);
        self.alcTopOfLbAutoLogIn.constant = HRATIO_HEIGHT(60);
        self.alcTopOfBtnLogIn.constant = HRATIO_HEIGHT(78);
        self.alcTopOfBtnFindInfo.constant = HRATIO_HEIGHT(75);
        self.alcTopOfLbBottom.constant = HRATIO_HEIGHT(75);
    }

}

-(void)setColor
{
    self.view.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.btnLogIn.backgroundColor = [self.util getColorWithRGBCode:@"f386a1"];
    self.swcAutoLogIn.onTintColor = [self.util getColorWithRGBCode:@"f386a1"];
    self.tfEmail.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    self.tfPassWord.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    
    self.lbEmail.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbPassWord.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbBottom.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    self.lbAutoLogIn.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.btnLogIn.titleLabel.textColor = [self.util getColorWithRGBCode:@"ffffff"];
    
    self.btnFindInfo.titleLabel.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbLogInInfo.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.ivNavigationBottomColor.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    
    self.ivTopLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    self.ivBtnTopLine.backgroundColor = [self.util getColorWithRGBCode:@"c2c0ba"];
    self.ivBtnBottomLine.backgroundColor = [self.util getColorWithRGBCode:@"c2c0ba"];
    
    self.lbURL.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    
    self.tfEmail.layer.borderWidth = 1.0f;
    self.tfEmail.layer.borderColor = [self.util getColorWithRGBCode:@"c2c0ba"].CGColor;
    
    self.tfPassWord.layer.borderWidth = 1.0f;
    self.tfPassWord.layer.borderColor = [self.util getColorWithRGBCode:@"c2c0ba"].CGColor;

}


#pragma mark - URLSession
-(void)startSession
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:LOGIN_API];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPMethod:@"POST"];
    
    NSNumber *autoLogIn = [NSNumber numberWithBool:self.swcAutoLogIn.on];
    NSLog(@"%@", autoLogIn);
    NSDictionary *HTTPBodyDic = @{@"email" : self.tfEmail.text,
                                  @"password" : self.tfPassWord.text,
                                  @"autoSignin" : autoLogIn };
    
    NSError *error;
    
    [urlRequest setHTTPBody:[NSJSONSerialization dataWithJSONObject:HTTPBodyDic options:0 error:&error]];
    
    [[session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        id sentData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        [self processingUrlRequestWithParam: sentData];
        
        NSLog(@"%@", sentData);
        
    }] resume];
}

-(void)processingUrlRequestWithParam:(id)param
{
    if([param isKindOfClass:[NSArray class]])
    {
        NSLog(@"erorr");
    }
    if([param isKindOfClass:[NSDictionary class]])
    {
        self.sentDataDic = param;
        
        UserInformation *userInfo = [[UserInformation alloc]initWithResults:self.sentDataDic];
        self.library.userInfo = userInfo;
        
    }
    if([self.userInfo result])
    {
        NSLog(@"LogIn");
        [self startSessionForHomeImg];
        
        //쿠키값 불러오기
        NSHTTPCookieStorage *cookieStor = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        NSArray *cookiesArr = [cookieStor cookiesForURL:[NSURL URLWithString: LOGIN_API]];

        NSLog(@"%@", cookiesArr);
    }
    else
    {
        NSLog(@"fail");
    }
}

-(void)startSessionForHomeImg
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:MAIN_API];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
               {
                   id receiveData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                   
                   [self processingHomeRequestWithParam:receiveData];
               }];
    [task resume];

}

-(void)processingHomeRequestWithParam:(id)param
{
    if([param isKindOfClass:[NSDictionary class]])
    {

        dispatch_async(dispatch_get_main_queue(), ^{
                NSString *sgId = @"sgLogInToMainView";
                [self performSegueWithIdentifier:sgId sender:self];
        });
        //뷰가 그려지는 중에 UI의 변경이 있을 경우는 이 코드를 사용해야함.
    }
}


#pragma mark - TextField Keyboard
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - Segue Event
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"sgLogInToMainView"])
    {
        //MainViewController *mainVC = [segue destinationViewController];
       // mainVC.userInfo = self.userInfo;
       // mainVC.mainInfo = self.mainInfo;
    }
}

@end

