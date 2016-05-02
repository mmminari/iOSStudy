//
//  UserInformation.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "UserInformation.h"


@interface UserInformation ()

@property (weak, nonatomic) NSString *userName;
@property (assign, nonatomic) BOOL result;
@property (weak, nonatomic) NSString *userId;


@end

@implementation UserInformation

-(void)setUserNameWithString:(NSString *)name
{
    self.userName = name;
    
}
-(BOOL)getResult
{
    return self.result;
}
-(void)setResultWithBoolean:(BOOL)result
{
    self.result = result;
}
-(NSString *)getUserName
{
    return self.userId;
}

@end
