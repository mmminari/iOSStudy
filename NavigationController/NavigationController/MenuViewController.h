//
//  MenuViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInformation.h"
#import "BaseViewController.h"
#import "MainViewController.h"

@interface MenuViewController : BaseViewController

@property (strong, nonatomic) UserInformation *userInfo;
@property (strong, nonatomic) MainViewController *mainVC;

@property (weak, nonatomic) IBOutlet UIView *logOutViewContainer;


-(void)viewWillAppear:(BOOL)animated;
-(void)setMenuLogInLayOut;
-(void)setMenuLogOutLayOut;



@end
