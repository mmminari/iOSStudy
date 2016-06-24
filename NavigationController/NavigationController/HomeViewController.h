//
//  HomeViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogInViewController.h"
#import "UserInformation.h"
#import "BaseViewController.h"
#import "MainInformation.h"
#import "MainViewController.h"

@interface HomeViewController : BaseViewController

@property (strong, nonatomic) NSDictionary *userInfoDic;
@property (strong, nonatomic) IBOutlet UILabel *lbUserName;
@property (strong, nonatomic) IBOutlet UILabel *lbUserEmail;

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userEmail;
@property (assign, nonatomic) NSInteger userPoint;
@property (strong, nonatomic) UIImage *bannerImage;
@property (strong, nonatomic) NSString *eventText;

@property (assign, nonatomic) BOOL result;

@property(strong, nonatomic) UserInformation *userInfomation;
@property (strong, nonatomic) MainInformation *mainInfo;

@property (strong, nonatomic) MainViewController *mainVC;


@property (weak, nonatomic) IBOutlet UILabel *lbMiddleNotice;


-(void)viewWillAppear:(BOOL)animated;


@end
