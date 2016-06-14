//
//  LibraryClass.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInformation.h"
#import "MainInformation.h"


@interface LibraryClass : NSObject


+ (instancetype)sharedInstance;

@property (strong, nonatomic) UserInformation *userInfo;
@property (strong, nonatomic) MainInformation *mainInfo;

-(void)getMainInformationWithParam:(id)param success:(void (^)(id results))success failure:(void (^)(NSError *error))failure;
-(void)getUserInformationWithParam:(id)param success:(void (^)(id results))success failure:(void (^)(NSError *error))failure;
-(void)getStoreInformationWithParam:(id)param success:(void (^)(id results))success failure:(void (^)(NSError *error))failure;
-(void)getLogInResultsWithParam:(id)param success:(void (^)(id results))success failure:(void (^)(NSError *error))failure;
@end
