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
    
    self.ivBack.image = [UIImage imageNamed:@"btn_back"];
    self.ivBottomColor.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    
}

- (IBAction)touchedGoBack:(id)sender {
 
    [self.baseVC.navigationController popViewControllerAnimated:YES];
    
}

@end
