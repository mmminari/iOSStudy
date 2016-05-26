//
//  MenuUserInfoViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuUserInfoViewController.h"
#import "ShowMenuViewController.h"

@interface MenuUserInfoViewController ()

@property (strong, nonatomic) ShowMenuViewController *showVC;


@end

@implementation MenuUserInfoViewController

-(void)viewDidLoad
{
    [super viewDidLoad] ;
    self.showVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view addSubview:self.showVC.view];
    self.showVC.infoVC = self;
    
    self.showVC.lbTitle.text = self.title;
    
}

@end
