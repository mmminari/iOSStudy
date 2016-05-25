//
//  MenuEventViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuEventViewController.h"
#import "ShowMenuViewController.h"


@interface MenuEventViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivTopLine;
@property (weak, nonatomic) IBOutlet UITableView *tvEvent;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) ShowMenuViewController *naviVC;

@end

@implementation MenuEventViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.naviVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view insertSubview:self.naviVC.view belowSubview:self.containerView];
    
    [self.util setContentViewLayoutWithSubView:self.naviVC.view withTargetView:self.view];
    self.naviVC.eventVC = self;
    
    self.naviVC.lbTitle.text = self.title;
    
    NSLog(@"title : %@", self.title);

    self.ivTopLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    self.tvEvent.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.containerView.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];




}

@end
