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
    self.naviVC.lbTitle.text = [self.photo title];

    CGFloat height = [[self.photo heightM]floatValue];
    CGFloat width = [[self.photo widthM]floatValue];
    
    self.alcWidthOfIv.constant = DEVICE_WIDTH;
    self.alcHeightOfIv.constant = [self setHeightWithOrignHeight:height originalWidth:width];

    
    [self.library setImageView:self.ivDetail urlString:[self.photo urlM] placeholderImage:nil animation:NO];
    
    
}


-(CGFloat)setHeightWithOrignHeight:(CGFloat)height originalWidth:(CGFloat)width
{
    height = height * DEVICE_WIDTH / width;
    
    return height;

}



@end
