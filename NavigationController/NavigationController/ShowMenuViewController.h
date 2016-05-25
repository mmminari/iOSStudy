//
//  ShowMenuViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 23..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MainViewController.h"
#import "MenuEventViewController.h"
#import "MenuNoticeViewController.h"
#import "MenuCustomerCenterViewController.h"
#import "MenuAgreementViewController.h"
#import "MenuUserInfoViewController.h"

@interface ShowMenuViewController : BaseViewController

@property (strong, nonatomic) NSString *titleString;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIView *navigationView;

@property (strong, nonatomic) MainViewController *mainVC;
@property (strong, nonatomic) MenuEventViewController *eventVC;
@property (strong, nonatomic) MenuNoticeViewController *notiVC;
@property (strong, nonatomic) MenuCustomerCenterViewController *customVC;
@property (strong, nonatomic) MenuAgreementViewController *agreeVC;
@property (strong, nonatomic) MenuUserInfoViewController *infoVC;





@end
