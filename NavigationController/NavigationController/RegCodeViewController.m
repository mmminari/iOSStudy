//
//  RegCodeViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "RegCodeViewController.h"

@interface RegCodeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ivTopLine;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottomLine;
@property (weak, nonatomic) IBOutlet UIImageView *ivIconTop;
@property (weak, nonatomic) IBOutlet UIImageView *ivIconBottom;
@property (weak, nonatomic) IBOutlet UIButton *btnReg;
@property (weak, nonatomic) IBOutlet UILabel *lbExplainTop;
@property (weak, nonatomic) IBOutlet UILabel *lbExplainBottom;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIView *tfContainer;
@property (weak, nonatomic) IBOutlet UIImageView *ivFfBackground;
@property (weak, nonatomic) IBOutlet UITextField *tfInputCode;
@property (weak, nonatomic) IBOutlet UIButton *btnHide;

@end

@implementation RegCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btnHide setHidden: YES];
    
    self.ivIconTop.image = [UIImage imageNamed:@"icon_info"];
    self.ivIconBottom.image = [UIImage imageNamed:@"icon_info"];
    
    [self setColorAndFont];
    
    UIImage *img = [UIImage imageNamed:@"box_white2"];
    
    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(40.0f, 40.0f, 40.0f, 40.0f)
                              resizingMode:UIImageResizingModeStretch];
    
    self.ivFfBackground.image = img;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *) textField
{
    [textField resignFirstResponder];
    [self.btnHide setHidden:YES];
    
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self.btnHide setHidden:NO];
    return YES;
    
}

- (IBAction)touchedHideKeyboard:(id)sender
{
    [self.tfInputCode resignFirstResponder];
    [self.btnHide setHidden:YES];
    
}

-(void)setColorAndFont
{
    self.view.backgroundColor = [self.util getColorWithRGBCode:@"f9f7f0"];
    self.tfContainer.backgroundColor = [self.util getColorWithRGBCode:@"f9f7f0"];
    self.ivTopLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    self.ivBottomLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbTitle.text = @"앨범구매 및 공연관람 티켓 인증 코드를 등록 해주세요.";
    self.lbTitle.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(54.0f)];
    self.lbTitle.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbExplainTop.text = @"공연관람 티켓 인증 코드는 공연 관람 완료 후 등록 가능 합니다.";
    self.lbExplainTop.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbExplainTop.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    
    self.lbExplainBottom.text = @"앨범구매 인증 코드는 구매 후 7일 후 등록 가능합니다.";
    self.lbExplainBottom.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbExplainBottom.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    
    [self.btnReg setTitle:@"등록하기" forState:UIControlStateNormal];
    [self.btnReg setTitleColor:[self.util getColorWithRGBCode:@"ffffff"] forState:UIControlStateNormal];
    [self.btnReg setBackgroundColor:[self.util getColorWithRGBCode:@"f386a1"]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
