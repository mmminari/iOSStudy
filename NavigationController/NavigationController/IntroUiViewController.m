//
//  IntroUiViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 22..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "IntroUiViewController.h"

@interface IntroUiViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivLogoImage;
@property (weak, nonatomic) IBOutlet UIButton *btnOk;
@property (weak, nonatomic) IBOutlet UITextField *tfInput;

@property (weak, nonatomic) IBOutlet UILabel *lbInputComment;
@property (weak, nonatomic) IBOutlet UILabel *lbPrivateService;
@property (weak, nonatomic) IBOutlet UILabel *lbDetail;
@property (strong, nonatomic) IBOutlet UIView *mainContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottomImage;

@end

@implementation IntroUiViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    self.mainContainerView.backgroundColor = [UIColor colorWithRed:1 green:0.709 blue:0.749 alpha:1];
    self.btnOk.backgroundColor = [UIColor colorWithRed:0.294 green:0.294 blue:0.294 alpha:1];
    self.lbInputComment.textColor = [UIColor colorWithRed:0.294 green:0.294 blue:0.294 alpha:1];
    self.lbPrivateService.textColor = [UIColor colorWithRed:0.294 green:0.294 blue:0.294 alpha:1];
    self.lbDetail.textColor = [UIColor colorWithRed:0.294 green:0.294 blue:0.294 alpha:1];
    
    self.ivBottomImage.image = [UIImage imageNamed:@"SM_logos.png"];
    self.tfInput.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    self.ivLogoImage.image = [UIImage imageNamed:@"smtownmembership_logo@3x.png"];
    
    
    
    
    
}

@end
