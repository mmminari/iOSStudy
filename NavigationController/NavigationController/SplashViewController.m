//
//  SplashViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivSplash;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (strong, nonatomic) NSUserDefaults *autoSignIn;
@property (strong, nonatomic) NSDictionary *resultDic;
@property (strong, nonatomic) NSNotificationCenter *notiCenter;


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
    
    [self startSession];

    //NSNotificationCenter을 사용하여 통신이 끝난 후 데이터를 넘겨줌
    self.notiCenter = [NSNotificationCenter defaultCenter];
    [self.notiCenter addObserver:self selector:@selector(sendData:) name:@"noti" object:nil];
    
    self.mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-main"];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.notiCenter removeObserver:self];
}

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
                                      [self.notiCenter postNotificationName:@"noti" object:self.resultDic];
                                  }
                                  
                              }];
    [task resume];

}


-(void)sendData:(NSNotification *)notification
{
    [self.library initWithResults:[notification object]];
    NSLog(@"send");

    [self.mainVC.cvMainView reloadData];
    
}

@end
