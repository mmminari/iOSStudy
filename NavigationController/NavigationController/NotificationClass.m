//
//  NotificationClass.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 17..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "NotificationClass.h"

@interface NotificationClass ()


@property (strong, nonatomic) OneSignal *oneSignal;


@end

@implementation NotificationClass



-(void)registerDeviceTokenWithLaunchOptions:(NSDictionary *)launchOptions
{
    self.oneSignal = [[OneSignal alloc]initWithLaunchOptions:launchOptions appId:@"455bc063-965c-4eb6-86c5-3956b092e444" handleNotification:nil];
    
    LogYellow(@"register");
}

-(void)saveDeviceToken:(NSData *)deviceToken
{
    NSString *tokenString = [deviceToken description];
    NSString *deviceTokenString = [tokenString substringWithRange:NSMakeRange(1, tokenString.length-2)];
    
    [[NSUserDefaults standardUserDefaults]setObject:deviceTokenString forKey:@"deviceToken"];
}

-(NSString *)getDeviceToken
{
    NSString *result = nil;
    result = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
    
    return result;
}

-(void)setPayload:(NSDictionary *)userInfo
{
    self.pushModel = [[PushModel alloc]initWithUserInfo:userInfo];
    NSLog(@"userInfo %@", userInfo);
    
    LogYellow(@"savePayload")   ;
    
}




@end
