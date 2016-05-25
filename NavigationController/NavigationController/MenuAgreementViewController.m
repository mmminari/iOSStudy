//
//  MenuAgreementViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuAgreementViewController.h"
#import "ShowMenuViewController.h"

@interface MenuAgreementViewController ()

@property (strong, nonatomic) ShowMenuViewController *showVC;


@end

@implementation MenuAgreementViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.showVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view addSubview:self.showVC.view];
    
    self.showVC.agreeVC = self;
    
    
    
}

@end
