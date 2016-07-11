//
//  DetailThumbnailViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 11..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "DetailThumbnailViewController.h"
#import "ShowMenuViewController.h"
#import "Photo.h"

@interface DetailThumbnailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivDetail;
@property (strong, nonatomic) ShowMenuViewController *naviVC;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfIv;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfIv;

@end

@implementation DetailThumbnailViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.naviVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view addSubview:self.naviVC.view];
    [self.util setContentViewLayoutWithSubView2:self.naviVC.view withTargetView:self.view];
    self.naviVC.baseVC = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    LogGreen(@"index num : %zd", self.indexNum);
    Photo *thumbnail = self.library.thumbImageArr[self.indexNum];
    
    self.naviVC.lbTitle.text = [thumbnail title];
    
    [self.library setImageView:self.ivDetail urlString:[thumbnail urlM] placeholderImage:nil animation:NO];
    
    self.alcWidthOfIv.constant = DEVICE_WIDTH;
    CGFloat height = [[thumbnail heightM]floatValue];
    CGFloat width = [[thumbnail widthM]floatValue];
    
    height = height * DEVICE_WIDTH / width;
    self.alcHeightOfIv.constant = height;
}

@end
