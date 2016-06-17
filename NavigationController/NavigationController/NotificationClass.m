//
//  NotificationClass.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 17..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "NotificationClass.h"

@implementation NotificationClass


-(instancetype)initWithUserInfo:(NSDictionary *)userInfo
{
    if(self = [super init])
    {
        _targetView = [self getValueWithKey:@"targetView" Dictionary:[self getValueWithKey:@"a" Dictionary:[self getValueWithKey:@"custom" Dictionary:userInfo]]];
        LogYellow(@"targetView %@", _targetView);
        
        
    }
    
    return self;
}


-(NSString *)getDeviceTokenString
{
    NSString *string = nil;
    
    return string;
    
}

@end
