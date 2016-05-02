//
//  HomeViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogInViewController.h"

@interface HomeViewController : UIViewController

@property (strong, nonatomic) NSDictionary *userInfoDic;
@property (strong, nonatomic) IBOutlet UILabel *lbUserName;
@property (strong, nonatomic) IBOutlet UILabel *lbUserEmail;

@property (strong, nonatomic) LogInViewController *logInVC;

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userEmail;
@property (assign, nonatomic) NSInteger userPoint;


@property (assign, nonatomic) BOOL result;



@end
