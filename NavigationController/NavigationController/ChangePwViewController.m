//
//  ChangePwViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ChangePwViewController.h"

@interface ChangePwViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivTopLine;
@property (weak, nonatomic) IBOutlet UILabel *lbCurrentPw;
@property (weak, nonatomic) IBOutlet UITextField *tfCurrentPw;
@property (weak, nonatomic) IBOutlet UILabel *lbNewPw;
@property (weak, nonatomic) IBOutlet UITextField *tfNewPw;
@property (weak, nonatomic) IBOutlet UILabel *lbCheckPw;
@property (weak, nonatomic) IBOutlet UITextField *tfCheckPw;
@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet UILabel *lbExplain;
@property (weak, nonatomic) IBOutlet UILabel *lbExplain2;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottomLine;
@property (weak, nonatomic) IBOutlet UIButton *btnChange;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTfCurrentPw;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfNewPw;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCheckPw;


@end

@implementation ChangePwViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.alcHeightOfNewPw.constant = WRATIO_WIDTH(115.0f);
    self.alcHeightOfCheckPw.constant = WRATIO_WIDTH(115.0f);
    self.alcHeightOfTfCurrentPw.constant = WRATIO_WIDTH(115.0f);
    
    self.ivIcon.image = [UIImage imageNamed:@"icon_info"];
    
    [self setColorAndFont];
}

-(void)setColorAndFont
{
    
    self.view.backgroundColor = [self.util getColorWithRGBCode:@"f9f7f0"];
    self.ivTopLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    self.ivBottomLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbCurrentPw.text = @"현재 비밀번호";
    self.lbCurrentPw.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(48.0f)];
    self.lbCurrentPw.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbNewPw.text = @"새 비밀번호";
    self.lbNewPw.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(48.0f)];
    self.lbNewPw.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbCheckPw.text = @"새 비밀번호 확인";
    self.lbCheckPw.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(48.0f)];
    self.lbCheckPw.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbExplain.text = @"카드 비밀번호는 최초 발급 시 생년월일 중 월일로 자동설정 됩니다.";
    self.lbExplain.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbExplain.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    
    self.lbExplain2.text = @"ex) 생년월일 2000년 12월 12일 / 카드 비밀번호: 12121";
    self.lbExplain2.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbExplain2.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    
    [self.btnChange setTitle:@"변경하기" forState:UIControlStateNormal];
    [self.btnChange setTitleColor:[self.util getColorWithRGBCode:@"ffffff"] forState:UIControlStateNormal];
    [self.btnChange setBackgroundColor:[self.util getColorWithRGBCode:@"f386a1"]];
    
    self.tfCheckPw.layer.borderColor = [self.util getColorWithRGBCode:@"c2c0ba"].CGColor;
    self.tfNewPw.layer.borderColor = [self.util getColorWithRGBCode:@"c2c0ba"].CGColor;
    self.tfCheckPw.layer.borderColor = [self.util getColorWithRGBCode:@"c2c0ba"].CGColor;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
