//
//  UserInformation.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject


@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *userName;
@property (assign, nonatomic) NSInteger point;
@property (strong, nonatomic) NSString *profileImg;
@property (assign, nonatomic) BOOL result;
@property (strong, nonatomic) NSString *cardNo;
@property (strong, nonatomic) NSString *cardRegdate;
@property (strong, nonatomic) NSString *strUserGrade;




-(void)setUserNameWithString:(NSString *)name;
-(BOOL)getResult;
-(void)setResultWithBoolean:(BOOL)result;
-(NSString *)getUserName;
-(void)setUserPointWithInteger:(NSInteger)point;
-(void)setUserIdWithString:(NSString *)userId;
-(NSString *)getUserId;
-(NSInteger)getUserPoint;


-(id)initWithName:(NSString *)name withId:(NSString *)userID withPoint:(NSInteger)point withResult:(BOOL)result;
-(instancetype)initWithResults:(NSDictionary *)results;



@end
