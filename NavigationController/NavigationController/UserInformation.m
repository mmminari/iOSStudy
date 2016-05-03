//
//  UserInformation.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "UserInformation.h"


@interface UserInformation ()

@property (assign, nonatomic) BOOL result;
@property (strong, nonatomic) NSString *userId;
@property (assign, nonatomic) NSInteger userPoint;
@property (strong, nonatomic) NSString *userName;


@end

@implementation UserInformation


-(id)initWithName:(NSString *)name withId:(NSString *)userID withPoint:(NSInteger)point withResult:(BOOL)result
{
    self = [super init];
    if(self != nil)
    {
        self.userName = name;
        self.userId = userID;
        self.userPoint = point;
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
    self.userPoint = point;
    
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
    return self.userPoint;
}

@end
