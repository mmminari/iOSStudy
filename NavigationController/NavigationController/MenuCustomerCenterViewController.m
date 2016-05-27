//
//  MenuCustomerCenterViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuCustomerCenterViewController.h"
#import "ShowMenuViewController.h"

@interface MenuCustomerCenterViewController ()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopLine;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbSubTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnGoToAsk;
@property (weak, nonatomic) IBOutlet UIImageView *ivMiddleLine;
@property (weak, nonatomic) IBOutlet UILabel *lbQandA;
@property (weak, nonatomic) IBOutlet UILabel *lbSubQA;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottomLine;

@property (strong, nonatomic) ShowMenuViewController *showVC;

@end

@implementation MenuCustomerCenterViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    
    self.backgroundView.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.lbTitle.text = @"1:1 문의";
    self.lbTitle.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(48.0f)];
    self.lbTitle.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbSubTitle.text = @"이메일로 1:1 문의를 하실 수 있습니다.";
    self.lbSubTitle.font = [UIFont systemFontOfSize:WRATIO_WIDTH(42.0f)];
    self.lbSubTitle.textColor = [self.util getColorWithRGBCode:@"757575"];
    
    self.btnGoToAsk.backgroundColor = [self.util getColorWithRGBCode:@"f386a1"];
    
    self.ivMiddleLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbQandA.text = @"FAQ";
    self.lbQandA.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(48.0f)];
    self.lbQandA.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbSubQA.text = @"궁금해 하시는 질문과 답변을 모아두었습니다.";
    self.lbSubQA.font = [UIFont systemFontOfSize:WRATIO_WIDTH(42.0f)];
    self.lbSubQA.textColor = [self.util getColorWithRGBCode:@"757575"];
    
    self.ivBottomLine.backgroundColor = [self.util getColorWithRGBCode:@"c2c0ba"];
    self.ivTopLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    
    
    
    
}

@end
