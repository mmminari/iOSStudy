//
//  CardViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UserInformation.h"
#import "MainViewController.h"

@interface CardViewController : BaseViewController

@property (strong, nonatomic) UserInformation *userInfo;

@property (weak, nonatomic) IBOutlet UIButton *btnEnlargeCode;
@property (strong, nonatomic) MainViewController *mainVC;



@end
