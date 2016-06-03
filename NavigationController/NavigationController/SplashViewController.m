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

    
}

@end
