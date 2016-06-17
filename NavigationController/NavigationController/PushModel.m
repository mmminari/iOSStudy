//
//  PushModel.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 17..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "PushModel.h"
#import "UtilityClass.h"

@interface PushModel ()

@property(strong, nonatomic) UtilityClass *util;

@end

@implementation PushModel

-(instancetype)initWithUserInfo:(NSDictionary *)userInfo
{
    if(self = [super init])
    {
        LogGreen(@"userInfo %@", userInfo);
        
        _pushMessage = [self.util getValueWithKey:@"alert" Dictionary:[self.util getValueWithKey:@"aps" Dictionary:userInfo]];
        _sound = [self.util getValueWithKey:@"sound" Dictionary:[self.util getValueWithKey:@"aps" Dictionary:userInfo]];
       // _targetView = [self.util getValueWithKey:@"targetView" Dictionary:[self.util getValueWithKey:@"a" Dictionary:[self.util getValueWithKey:@"custom" Dictionary:userInfo]]];
        _targetView = [[[userInfo objectForKey:@"custom"]objectForKey:@"a"]objectForKey:@"targetView"];
        
        LogYellow(@"targetView %@ %@ ", _targetView, _sound);
        
        
    }
    
    return self;
}

-(instancetype)init
{
    if(self = [super init])
    {
        self.util = [[UtilityClass alloc]init];
    }
    
    return self;
}


@end
