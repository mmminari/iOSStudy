//
//  SplashViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "SplashViewController.h"
#import "MainInformation.h"
#import "UserInformation.h"

@interface SplashViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivSplash;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (strong, nonatomic) NSUserDefaults *autoSignIn;
@property (strong, nonatomic) NSDictionary *resultDic;


@end

@implementation SplashViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.indicator setHidesWhenStopped:YES];
    [self.indicator startAnimating];
    
    if (DEVICE_HEIGHT == 480) {
        self.ivSplash.image = [UIImage imageNamed:@"splash_640x960"];
    }
    if (DEVICE_HEIGHT == 568) {
        self.ivSplash.image = [UIImage imageNamed:@"splash_640x1136"];
    }
    if (DEVICE_HEIGHT == 667) {
        self.ivSplash.image = [UIImage imageNamed:@"splash_750x1334"];
    }
    if (DEVICE_HEIGHT == 736) {
        self.ivSplash.image = [UIImage imageNamed:@"splash_1242x2208"];
    }
    
    [self setResultOfAutoSignInWithSwith:NO];
    
    if ([self getResultOfAutoSignIn])
    {
        //[self startAutoSignInSession];
        [self requestUserInformation];
        
    }
    else
    {
        //[self startSession];
        [self requstMainInformation];
        
    }

}

#pragma mark - ARI request

-(void)requstMainInformation
{
    [self.library getMainInformationWithParam:nil success:^(id results) {
        
        if ([results isKindOfClass:[NSDictionary class]])
        {
            self.resultDic = results;
            MainInformation *mainInfo = [[MainInformation alloc]initWithResults:self.resultDic];
            self.library.mainInfo = mainInfo;
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"endDataTransit" object:nil];
        }
    } failure:^(NSError *error) {
        LogGreen(@"fail");
    }];
    
}

-(void)requestUserInformation
{
    [self.library getUserInformationWithParam:nil success:^(id results) {
        
        if ([results isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *result = (NSDictionary *)results;
            
            UserInformation *userInfo = [[UserInformation alloc]initWithResults:result];
            self.library.userInfo = userInfo;
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"endUserInfoTransit" object:nil];
            
        }
    } failure:^(NSError *error) {
        LogGreen(@"error");
    }];
}

/*
-(void)startSession
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:MAIN_API];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                              {
                                  id receiveData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                                  
                                  if ([receiveData isKindOfClass:[NSDictionary class]])
                                  {
                                      self.resultDic = receiveData;
                                      
                                      MainInformation *mainInfo = [[MainInformation alloc]initWithResults:self.resultDic];
                                      self.library.mainInfo = mainInfo;
                                      
                                      [[NSNotificationCenter defaultCenter] postNotificationName:@"endDataTransit" object:nil];
                                  }
                                  
                              }];
    [task resume];

}

-(void)startAutoSignInSession
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *urlString = [NSURL URLWithString:AUTO_SIGN_IN_API];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlString];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                              {
                                  id receiveData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
                                  if ([receiveData isKindOfClass:[NSDictionary class]])
                                  {
                                      NSDictionary *result = (NSDictionary *)receiveData;
                                      
                                      UserInformation *userInfo = [[UserInformation alloc]initWithResults:result];
                                      self.library.userInfo = userInfo;
                                      
                                      [[NSNotificationCenter defaultCenter] postNotificationName:@"endUserInfoTransit" object:nil];

                                      
                                      
                                  }
                                  
                                  
                              }];
    
    [task resume];
}

*/


@end
