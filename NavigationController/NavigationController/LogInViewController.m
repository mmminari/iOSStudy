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

#define LOGIN_API                                                   @"https://pointapibeta.smtown.com/api/v1/accountSignin"

#define DEVICE_WIDTH                                                [UIScreen mainScreen].bounds.size.width
#define STANDARD_DEVICE_WIDTH                                       414.0f
#define WRATIO_WIDTH(w)                                             (w/3.0f) / STANDARD_DEVICE_WIDTH * DEVICE_WIDTH

#define DEVICE_HEIGHT                                               [UIScreen mainScreen].bounds.size.height
#define STANDARD_DEVICE_HEIGHT                                      736.0f
#define HRATIO_HEIGHT(h)                                            (h/3.0f) / STANDARD_DEVICE_HEIGHT * DEVICE_HEIGHT

@interface LogIn : NSObject

@property (assign, nonatomic) BOOL result;
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSObject *data;


@end

@implementation LogIn



@end

@interface LogInViewController ()


@property(strong, nonatomic) IntroUiViewController *IntroVC;
@property(strong, nonatomic) LogIn *LogInClass;


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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfSwc;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfSwc;

@property (weak, nonatomic) NSDictionary *sentDataDic;

@property (weak, nonatomic) IBOutlet UIImageView *ivButton;
@property (weak, nonatomic) IBOutlet UILabel *lbLogInInfo;

@end


@implementation LogInViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];

    self.IntroVC = [[IntroUiViewController alloc] init];
    self.LogInClass = [[LogIn alloc]init];
    
    self.lbLogInInfo.text = @"로그인 정보";
    self.ivButton.image = [UIImage imageNamed:@"btn_back"];
    
    
    
    [self setColor];
    [self setAutoLayout];
  
    

    
}

#pragma mark - User Touched Event

- (IBAction)touchedLogIn:(id)sender {
    [self startSession];
    
    
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
    
    
    self.alcWidthOfSwc.constant = WRATIO_WIDTH(120);
    self.alcHeightOfSwc.constant = WRATIO_WIDTH(45);
    
    self.btnLogIn.titleLabel.font = [UIFont systemFontOfSize:WRATIO_WIDTH(48)];
    self.btnFindInfo.titleLabel.font = [UIFont systemFontOfSize:WRATIO_WIDTH(51)];
    
    self.lbLogInInfo.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(54)];
    
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
    self.view.backgroundColor = [self.IntroVC getColorWithRGBCode:@"f9f7f0"];
    self.btnLogIn.backgroundColor = [self.IntroVC getColorWithRGBCode:@"f386a1"];
    self.swcAutoLogIn.onTintColor = [self.IntroVC getColorWithRGBCode:@"f386a1"];
    self.tfEmail.textColor = [self.IntroVC getColorWithRGBCode:@"7d7d7d"];
    self.tfPassWord.textColor = [self.IntroVC getColorWithRGBCode:@"7d7d7d"];
    
    
    self.lbEmail.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    self.lbPassWord.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    self.lbBottom.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    
    self.btnLogIn.titleLabel.textColor = [self.IntroVC getColorWithRGBCode:@"ffffff"];
    
    self.btnFindInfo.titleLabel.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    
    self.lbLogInInfo.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    
    
}


#pragma mark - URLSession

-(void)startSession
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:LOGIN_API];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPMethod:@"POST"];
    
    NSDictionary *HTTPBodyDic = @{@"email" : self.tfEmail.text,
                                  @"password" : self.tfPassWord.text };
    
    NSError *error;
    
    [urlRequest setHTTPBody:[NSJSONSerialization dataWithJSONObject:HTTPBodyDic options:0 error:&error]];
    
    [[session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        id sentData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        if([sentData isKindOfClass:[NSArray class]])
        {
            NSLog(@"erorr");
        }
        if([sentData isKindOfClass:[NSDictionary class]])
        {
            
            NSLog(@"%@%@", self.tfEmail.text, self.tfPassWord.text);
            
            self.sentDataDic = sentData;
            [self processingUrlRequestWithParam: self.sentDataDic ];
            NSLog(@"%@", error);
            
            
            
        }
    }] resume];
    
    
}

-(void)processingUrlRequestWithParam:(id)param
{
    self.LogInClass.result = [[param objectForKey:@"result"] boolValue];
    self.LogInClass.message = [param objectForKey:@"message"];
    
    if(self.LogInClass.result)
    {
        NSLog(@"LogIn");
         dispatch_async(dispatch_get_main_queue(), ^{
             [self performSegueWithIdentifier:@"sgLogIntoHomeView" sender:self];
            });
    }
    else
    {
        NSLog(@"fail");
        
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
    if([[segue identifier] isEqualToString:@"sgLogIntoHomeView"]){
        HomeViewController *HomeVC = [segue destinationViewController];
        HomeVC = [[HomeViewController alloc]init];
        
        HomeVC.userInfoDic = [[NSDictionary alloc]init];
        HomeVC.userInfoDic = self.sentDataDic;

    }
    
    if([[segue identifier]isEqualToString:@"sgLogIntoIntroView"]){
        
    }
}



@end

