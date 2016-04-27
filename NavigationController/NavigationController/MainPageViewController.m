//
//  MainPageViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()




@end

@implementation MainPageViewController
-(void)viewDidLoad{
    UITabBarController *tabBarController;
    tabBarController = [[UITabBarController alloc]init];
    
    // define a custom frame size for the entire tab bar controller that will be in the
    // top of the screen.
    CGRect tabBarFrame;
    tabBarFrame = CGRectMake(0, 0, 320, 200);
    tabBarController.view.frame = tabBarFrame;
}
@end

