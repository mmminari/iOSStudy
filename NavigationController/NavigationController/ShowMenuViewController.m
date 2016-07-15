//
//  ShowMenuViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 23..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ShowMenuViewController.h"

@interface ShowMenuViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivBottomColor;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfNaviBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomIvIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfIvIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfIvIcon;

@end

@implementation ShowMenuViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.ivBack.image = [UIImage imageNamed:@"btn_back"];
    self.ivBottomColor.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    
    self.alcHeightOfNaviBar.constant = HRATIO_HEIGHT(213.0f);
    self.alcBottomIvIcon.constant = HRATIO_HEIGHT(54.0f);
    self.lbTitle.font = [UIFont systemFontOfSize:WRATIO_WIDTH(51.0f)];
    self.alcWidthOfIvIcon.constant = WRATIO_WIDTH(42.0f);
    self.alcHeightOfIvIcon.constant = WRATIO_WIDTH(63.0f);
    
    [self.btnCamera setHidden:YES];

}

- (IBAction)touchedGoBack:(id)sender
{
    //사용자가 아무 액션 없이 back버튼을 눌렀다면 매핑되었던 정보들을 지워주어야 기존의 url로 돌아 갈 수 잇음.
    self.library.scriptResults = nil;

    //present는 navigationController을 이용한 움직이기 때문에 naviController을 상속받는다. modal은 안받기 때문에 이걸로 구분.
    if(self.baseVC.navigationController)
    {
        [self.baseVC.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self.baseVC dismissViewControllerAnimated:true completion:nil];
    }
}

- (IBAction)touchedCameraButton:(id)sender
{
    [self.delegate didTouchCameraButton];
    
    LogBlue(@"didTouchCameaButton");
}

@end
