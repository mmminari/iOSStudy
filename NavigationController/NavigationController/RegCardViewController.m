//
//  RegCardViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "RegCardViewController.h"

@interface RegCardViewController ()

@property (strong, nonatomic) IBOutlet UIView *ivTopLine;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UITextField *tfInputCardNum;
@property (weak, nonatomic) IBOutlet UIImageView *ivEx1;
@property (weak, nonatomic) IBOutlet UIImageView *ivEx2;
@property (weak, nonatomic) IBOutlet UILabel *lbEx1;
@property (weak, nonatomic) IBOutlet UILabel *lbEx2;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottom;
@property (weak, nonatomic) IBOutlet UIButton *btnReg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTfReg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfBtn;
@property (weak, nonatomic) IBOutlet UIImageView *ivTfBackground;
@property (weak, nonatomic) IBOutlet UIView *ivTfContainer;
@property (weak, nonatomic) IBOutlet UIButton *btnHide;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfTopLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfTfContariner;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTfContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfIvIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfBottomLine;



@end

@implementation RegCardViewController


-(void)setLayout
{
    self.alcTopOfTopLine.constant = HRATIO_HEIGHT(231.0f);
    self.alcTopOfLbTitle.constant = HRATIO_HEIGHT(57.0f);
    
    self.alcTopOfTfContariner.constant = HRATIO_HEIGHT(57.0f);
    self.alcHeightOfTfContainer.constant = HRATIO_HEIGHT(117.0f);
    self.alcTopOfIvIcon.constant = HRATIO_HEIGHT(57.0f);
    self.alcTopOfBottomLine.constant = HRATIO_HEIGHT(78.0f);
    
    self.lbTitle.font = [UIFont systemFontOfSize:WRATIO_WIDTH(51.0f)];
    self.lbEx1.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbEx2.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    [self.btnReg.titleLabel setFont:[UIFont systemFontOfSize:WRATIO_WIDTH(45.0f)]];
    self.tfInputCardNum.font = [UIFont systemFontOfSize:WRATIO_WIDTH(45.0f)];

    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.btnHide setHidden:YES];
    
    self.ivEx1.image = [UIImage imageNamed:@"icon_info"];
    self.ivEx2.image = [UIImage imageNamed:@"icon_info"];

    [self setColorAndFont];
    
    self.alcHeightOfTfReg.constant = WRATIO_WIDTH(115.0f);
    self.alcHeightOfBtn.constant = WRATIO_WIDTH(115.0f);
    
    UIImage *img = [UIImage imageNamed:@"box_white2"];

    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(40.0f, 40.0f, 40.0f, 40.0f)
                              resizingMode:UIImageResizingModeStretch];
    
    self.ivTfBackground.image = img;
    self.tfInputCardNum.text = @"A0RE160831071742";
    
    [self setLayout];
    
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

#pragma mark - User Action

- (IBAction)touchedHideKeyBoard:(id)sender
{
    [self.tfInputCardNum resignFirstResponder];
    [self.btnHide setHidden:YES];

}

- (IBAction)touchedReisgerCard:(id)sender
{
    [self reqResigerCardNum];
}

-(void)reqResigerCardNum
{
    NSDictionary *inputData = @{ @"cardNo" : self.tfInputCardNum.text,
                                 @"userNo" : [NSNumber numberWithInteger:[self.library.userInfo userNo]],
                                 @"lang" : @"ko"};
    
    [self.library requestRegisterCardNumWithParameter:inputData success:^(id results) {
        NSDictionary *result = (NSDictionary *)results;
        if([self.util getValueWithKey:@"result" Dictionary:result])
        {
            [self showAlertViewWithTitle:[self.util getValueWithKey:@"code" Dictionary:result] message:[self.util getValueWithKey:@"message" Dictionary:result]  completion:nil];
 
        }
        
    } failure:^(NSError *error) {
        LogGreen(@"error");
    }];
}

#pragma mark - UI

-(void)setColorAndFont
{
    self.view.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.ivTfContainer.backgroundColor =[self.util getColorWithRGBCode:@"f9f9f0"];
    
    self.ivTopLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    self.ivBottom.backgroundColor = [self.util getColorWithRGBCode:@"7d7d7d"];

    self.lbTitle.text = @"신규 발급 카드 번호를 입력해주세요.";
    self.lbTitle.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(55.0f)];
    self.lbTitle.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbEx1.text = @"신규카드 등록 후 이전 카드번호는 사용이 불가능 합니다.";
    self.lbEx1.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbEx1.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    
    self.lbEx2.text = @"이전 카드번호의 포인트는 그대로 사용 가능 합니다.";
    self.lbEx2.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbEx2.textColor = [self.util getColorWithRGBCode:@"7d7d7d"];
    
    [self.btnReg setTitleColor:[self.util getColorWithRGBCode:@"ffffff"] forState:UIControlStateNormal];
    [self.btnReg setTitle:@"등록하기" forState:UIControlStateNormal];
    [self.btnReg.titleLabel setFont:[UIFont boldSystemFontOfSize:WRATIO_WIDTH(47.0f)]];
    [self.btnReg setBackgroundColor:[self.util getColorWithRGBCode:@"f386a1"]];

    
}

@end
