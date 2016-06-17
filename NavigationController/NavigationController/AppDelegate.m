//
//  AppDelegate.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "LibraryClass.h"


@interface AppDelegate ()

@property (strong, nonatomic) LibraryClass *lib;



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.lib = [LibraryClass sharedInstance];
    
    
    if([launchOptions objectForKey:@"UIApplicationLaunchOptionsRemoteNotificationKey"])
    {
        LogYellow(@"UIApplicationLaunchOptionsRemoteNotificationKey");
        self.lib.launchOption = YES;
    }
    else
    {
        LogYellow(@"no?");
        self.lib.launchOption = NO;
        
    }
    // Override point for customization after application launch.
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    self.oneSignal = [[OneSignal alloc]initWithLaunchOptions:launchOptions appId:@"455bc063-965c-4eb6-86c5-3956b092e444" handleNotification:nil];
    
    return YES;
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //device token값 넘기기
    LogGreen( @"data : %@" , deviceToken);
    NSString *tokenString = [deviceToken description];
    NSString *deviceTokenString = [tokenString substringWithRange:NSMakeRange(1, tokenString.length-2)];

    LogGreen(@"tokenString : %@", deviceTokenString);
    
}



- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))handler
{
    LogRed(@"foreground and userInfo : %@ ", [[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
    LogRed(@"info : %@", userInfo);
    

}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification
{
    LogRed(@"didReceiveLocalNotification");

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    if(UIApplicationStateInactive)
    {
        LogYellow(@"?");
    }

}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
