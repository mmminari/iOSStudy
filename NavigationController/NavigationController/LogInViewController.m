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

#define LOGIN_API                                                   @"https://pointapibeta.smtown.com/api/v1/push/login"

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





@end


@implementation LogInViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.IntroVC = [[IntroUiViewController alloc] init];
    self.LogInClass = [[LogIn alloc]init];
    
    self.navigationItem.title = @"로그인 정보"   ;
    
    int width = [UIScreen mainScreen].bounds.size.width;
    
    self.view.backgroundColor = [self.IntroVC getColorWithRGBCode:@"f9f7f0"];
    self.btnLogIn.backgroundColor = [self.IntroVC getColorWithRGBCode:@"f386a1"];
    self.swcAutoLogIn.onTintColor = [self.IntroVC getColorWithRGBCode:@"f386a1"];
    self.tfEmail.textColor = [self.IntroVC getColorWithRGBCode:@"7d7d7d"];
    self.tfPassWord.textColor = [self.IntroVC getColorWithRGBCode:@"7d7d7d"];

    
    self.lbEmail.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    self.lbPassWord.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    self.lbBottom.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];
    
    self.btnLogIn.titleLabel.font = [UIFont boldSystemFontOfSize:[self.IntroVC getWidthOfTargetWithTargetValue:16 andDevieWidth:width]];
    self.btnLogIn.titleLabel.textColor = [self.IntroVC getColorWithRGBCode:@"ffffff"];
    
    self.btnFindInfo.titleLabel.textColor = [self.IntroVC getColorWithRGBCode:@"424242"];

    
}

- (IBAction)touchedLogIn:(id)sender {
    [self startSession];
    
    
}


-(void)startSession
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:LOGIN_API];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPMethod:@"POST"];
    
    NSDictionary *HTTPBodyDic = @{@"username" : self.tfEmail.text,
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
            NSDictionary *sentDataDic;
            sentDataDic = sentData;
            [self processingUrlRequestWithParam:sentDataDic ];
            
            
        }
    }] resume];
    
    
}

-(void)processingUrlRequestWithParam:(id)param
{
    self.LogInClass.result = [param objectForKey:@"result"];
    self.LogInClass.message = [param objectForKey:@"message"];
    
    if(self.LogInClass.result){
        NSLog(@"LogIn");
     dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"sgLogIntoHomeView" sender:self];
     });
        
        
                    }
    
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"sgLogIntoHomeView"]){
        HomeViewController *HomeVC = [segue destinationViewController];
        HomeVC = [[HomeViewController alloc]init];
        
        HomeVC.userData= self.tfEmail.text;
        NSLog(@"%@", HomeVC.userData);
        
        
        
        
    }
}





@end

