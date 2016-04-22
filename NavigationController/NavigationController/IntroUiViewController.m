//
//  IntroUiViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 22..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "IntroUiViewController.h"

@interface IntroUiViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *LogoImage;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UITextField *inputTextfield;

@property (weak, nonatomic) IBOutlet UILabel *inputCommentLabel;
@property (weak, nonatomic) IBOutlet UILabel *privateServLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImage;

@end

@implementation IntroUiViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    self.mainView.backgroundColor = [UIColor colorWithRed:1 green:0.709 blue:0.749 alpha:1];
    self.okButton.backgroundColor = [UIColor colorWithRed:0.294 green:0.294 blue:0.294 alpha:1];
    self.inputCommentLabel.textColor = [UIColor colorWithRed:0.294 green:0.294 blue:0.294 alpha:1];
    self.privateServLabel.textColor = [UIColor colorWithRed:0.294 green:0.294 blue:0.294 alpha:1];
    self.detailLabel.textColor = [UIColor colorWithRed:0.294 green:0.294 blue:0.294 alpha:1];
    
    self.bottomImage.image = [UIImage imageNamed:@"SM_logos.png"];
    self.inputTextfield.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    self.LogoImage.image = [UIImage imageNamed:@"smtownmembership_logo@3x.png"];
    
    
    
    
    
}

@end
