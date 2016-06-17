//
//  AppDelegate.h
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OneSignal/OneSignal.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OneSignal *oneSignal;



@end

