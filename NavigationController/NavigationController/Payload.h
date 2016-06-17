//
//  Payload.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 17..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Payload : NSObject

@property (strong, nonatomic) NSString *pushMessage;
@property (strong, nonatomic) NSString *sound;
@property (strong, nonatomic) NSString *targetView;

-(instancetype)initWithUserInfo:(NSDictionary *)userInfo;



@end
