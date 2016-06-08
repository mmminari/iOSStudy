//
//  UserInformation.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface UserInformation : BaseModel


//User Info
@property (assign, nonatomic) NSInteger userNo;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *userName;
@property (assign, nonatomic) NSInteger status;
@property (assign, nonatomic) NSInteger userGrade;
@property (strong, nonatomic) NSString *strUserGrade;
@property (strong, nonatomic) NSString *cardNo;
@property (strong, nonatomic) NSString *profileImg;
@property (strong, nonatomic) NSString *cardRegdate;
@property (assign, nonatomic) NSInteger isCeleb;

//Point Info
@property (assign, nonatomic) NSInteger point;
@property (assign, nonatomic) NSInteger expectedPoint;
@property (assign, nonatomic) NSInteger addPoint;
@property (assign, nonatomic) NSInteger usePoint;
@property (assign, nonatomic) NSInteger rewardPoint;
@property (assign, nonatomic) NSInteger expPoint;
@property (assign, nonatomic) NSInteger exPoint;

//etc
@property (assign, nonatomic) BOOL result;


-(void)initWithResults:(NSDictionary *)results;

@end
