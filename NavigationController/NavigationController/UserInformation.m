//
//  UserInformation.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "UserInformation.h"

@interface UserInformation ()

@end

@implementation UserInformation

-(instancetype)initWithResults:(NSDictionary *)results
{
    if(self = [super init])
    {
        _userNo = [[self getValueWithKey:@"userNo" Dictionary:[self getValueWithKey:@"userInfo" Dictionary:results]] intValue];
        _userId = [self getValueWithKey:@"userId" Dictionary:[self getValueWithKey:@"userInfo" Dictionary:results]];
        _userName = [self getValueWithKey:@"userName" Dictionary:[self getValueWithKey:@"userInfo" Dictionary:results]];
        _point = [[self getValueWithKey:@"point" Dictionary:[self getValueWithKey:@"pointInfo" Dictionary:results]] integerValue];
        _result = [[self getValueWithKey:@"result" Dictionary:results] boolValue];
        _profileImg = [self getValueWithKey:@"profileImg" Dictionary:[self getValueWithKey:@"userInfo" Dictionary:results]];
        _cardNo = [self getValueWithKey:@"cardNo" Dictionary:[self getValueWithKey:@"userInfo" Dictionary:results]];
        _cardRegdate = [self getValueWithKey:@"cardRegdate" Dictionary:[self getValueWithKey:@"userInfo" Dictionary:results]];
        _strUserGrade = [self getValueWithKey:@"strUserGrade" Dictionary:[self getValueWithKey:@"userInfo" Dictionary:results]];
    }
    
    return self;
}


@end
