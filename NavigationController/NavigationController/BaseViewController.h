//
//  BaseViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 4..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UtilityClass.h"
#import "LibraryClass.h"

@interface BaseViewController : UIViewController

@property (strong, nonatomic) UtilityClass *util;
@property (assign, nonatomic) MenuList *menuList;
@property (strong, nonatomic) LibraryClass *library;

-(void)setTitleOfNavibarWithMenuList:(MenuList)list;

- (void)setCustomNavigationBarWithTitle:(NSString *)title;

-(void)setWebViewWithMenuList:(MenuList)list;

-(void)setResultOfAutoSignInWithSwith:(BOOL)swith;
-(BOOL)getResultOfAutoSignIn;

-(void)setTitleOfNavibarWithIndexPath:(NSIndexPath *)index;
-(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion;


@end
