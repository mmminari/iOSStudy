//
//  ShowMenuViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 23..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ShowMenuViewController.h"


@interface ShowMenuViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivBack;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottomColor;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;

@end

@implementation ShowMenuViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.lbTitle.text = self.title;
    self.ivBack.image = [UIImage imageNamed:@"btn_back"];
    self.ivBottomColor.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    
}

- (IBAction)touchedGoBack:(id)sender {
 
    if(self.eventVC)
    {
        [self.eventVC.navigationController popViewControllerAnimated:YES];
    }
    if(self.notiVC)
    {
        [self.notiVC.navigationController popViewControllerAnimated:YES];
    }
    if(self.customVC)
    {
        [self.customVC.navigationController popViewControllerAnimated:YES];
    }
    if(self.agreeVC)
    {
        [self.agreeVC.navigationController popViewControllerAnimated:YES];
    }
    if(self.infoVC)
    {
        [self.infoVC.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
