//
//  NotificationClass.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 17..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OneSignal/OneSignal.h>
#import "PushModel.h"

@interface NotificationClass : NSObject


//디바이스 토큰값 서버에 보내기
-(void)registerDeviceTokenWithLaunchOptions:(NSDictionary *)launchOptions;

//디바이스 토큰값 저장
-(void)saveDeviceToken:(NSData *)deviceToken;

//디바이스 토큰값 받아오기
-(NSString *)getDeviceToken;

//페이로드 매핑
-(void)setPayload:(NSDictionary *)userInfo;


@property (strong, nonatomic) PushModel *pushModel;









@end
