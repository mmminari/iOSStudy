//
//  NotificationClass.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 17..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UtilityClass.h"

@interface NotificationClass : UtilityClass


@property (strong, nonatomic) NSString *targetView;

-(instancetype)initWithUserInfo:(NSDictionary *)userInfo;



@end
