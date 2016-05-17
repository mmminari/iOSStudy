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
        _userId = [[results objectForKey:@"userInfo"]objectForKey:@"userId"];
        _userName = [[results objectForKey:@"userInfo"]objectForKey:@"userName"];
        _point = [[[results objectForKey:@"pointInfo"]objectForKey:@"point"] integerValue];
        _result = [[results objectForKey:@"result"] boolValue];
        _profileImg = [[results objectForKey:@"userInfo"] objectForKey:@"profileImg"];
        _cardNo = [[results objectForKey:@"userInfo"]objectForKey:@"cardNo"];
        _cardRegdate = [[results objectForKey:@"userInfo"] objectForKey:@"cardRegdate"];
        _strUserGrade = [[results objectForKey:@"userInfo"]objectForKey:@"strUserGrade"];
 
    }
    
    return self;
    
}


-(id)initWithName:(NSString *)name withId:(NSString *)userID withPoint:(NSInteger)point withResult:(BOOL)result
{
    self = [super init];
    if(self != nil)
    {
        self.userName = name;
        self.userId = userID;
        self.point = point;
        self.result = result;
        
    }
    
    return self;
    
}



-(void)setUserNameWithString:(NSString *)name
{
    self.userName = name;
    
}

-(void)setResultWithBoolean:(BOOL)result
{
    self.result = result;
}

-(void)setUserPointWithInteger:(NSInteger)point
{
    self.point = point;
    
}

-(void)setUserIdWithString:(NSString *)userId
{
    self.userId = userId;
}

-(BOOL)getResult
{
    return self.result;
}

-(NSString *)getUserName
{
    return self.userName;
}
-(NSString *)getUserId
{
    return self.userId;
}
-(NSInteger)getUserPoint
{
    return self.point;
}

@end
