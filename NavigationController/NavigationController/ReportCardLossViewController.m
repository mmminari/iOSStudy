//
//  ReportCardLossViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ReportCardLossViewController.h"

@interface ReportCardLossViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ivTopLine;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopIcon;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottonIcon;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottomLine;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbExTop1;
@property (weak, nonatomic) IBOutlet UILabel *lbExTop2;
@property (weak, nonatomic) IBOutlet UILabel *lbBottom1;
@property (weak, nonatomic) IBOutlet UILabel *lbBottom2;
@property (weak, nonatomic) IBOutlet UIButton *btnReport;

@end

@implementation ReportCardLossViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ivTopIcon.image = [UIImage imageNamed:@"icon_info"];
    self.ivBottonIcon.image = [UIImage imageNamed:@"icon_info"];
    
    [self setColorAndFont];
    
}
- (IBAction)touchedReportCardLoss:(id)sender
{
    [self reportCardLoss];
}

-(void)reportCardLoss
{
    NSDictionary *inputData = @{@"lang" : @"kr" };
    
    [self.library patchCardLossWithParam:inputData success:^(id results) {
        NSDictionary *result = (NSDictionary *)results;
        if([result objectForKey:@"result"])
        {
            UIAlertController  *alert = [UIAlertController alertControllerWithTitle:[result objectForKey:@"code"] message:[result objectForKey:@"message"] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    } failure:nil];
}
-(void)setColorAndFont
{
    self.view.backgroundColor = [self.util getColorWithRGBCode:@"f9f7f0"];
    self.ivTopLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    self.ivBottomLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbTitle.text = @"POINT CARD 분실 신고 하시겠습니까?";
    self.lbTitle.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(54.0f)];
    self.lbTitle.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    self.lbExTop1.text = @"포인트카드 분실 신고 후 분실 신고 해제는 불가능 합니다.";
    self.lbExTop2.text = @"신고 완료 후 신규 온라인 카드 번호가 발급 됩니다. 기존 포인트는 사용 가능 합니다.";
    self.lbBottom1.text = @"포인트카드 분실 신고 후 재 발급은 불가 합니다.";
    self.lbBottom2.text = @"(단, 매장에서 신규CARD 발급 후 카드 새로 등록 하기를 진행 하시면 기존 포인트 사용이 가능 합니다.)";
    
    [self.btnReport setTitle:@"신고하기" forState:UIControlStateNormal];
    [self.btnReport setTitleColor:[self.util getColorWithRGBCode:@"ffffff"] forState:UIControlStateNormal];
    [self.btnReport setBackgroundColor:[self.util getColorWithRGBCode:@"f386a1"]];
    
    self.lbExTop1.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbExTop1.textColor = [self.util getColorWithRGBCode:@"7d7d7d7"];
    
    self.lbExTop2.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbExTop2.textColor = [self.util getColorWithRGBCode:@"7d7d7d7"];
    
    self.lbBottom1.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbBottom1.textColor = [self.util getColorWithRGBCode:@"7d7d7d7"];
    
    self.lbBottom2.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    self.lbBottom2.textColor = [self.util getColorWithRGBCode:@"7d7d7d7"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
