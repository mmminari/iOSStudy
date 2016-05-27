//
//  MenuNoticeViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuNoticeViewController.h"
#import "ShowMenuViewController.h"

@interface MenuNoticeViewController ()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopLine;
@property (weak, nonatomic) IBOutlet UIImageView *ivMiddleLine;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbSubTitle;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottomLine;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@property (strong, nonatomic) ShowMenuViewController *showVC;
@end

@implementation MenuNoticeViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

      
    self.ivTopLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    self.ivMiddleLine.backgroundColor = [self.util getColorWithRGBCode:@"c2c0ba"];
    self.ivBottomLine.backgroundColor = [self.util getColorWithRGBCode:@"c2c0ba"];
    self.lbTitle.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(48.0f)];
    self.lbSubTitle.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbTitle.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbSubTitle.textColor = [self.util getColorWithRGBCode:@"757575"];
    
    self.backgroundView.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.textView.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.btnNext.backgroundColor = [self.util getColorWithRGBCode:@"f386a1"];
    
    self.btnNext.titleLabel.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(47.0f)];
    
    
}
@end
