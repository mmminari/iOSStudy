//
//  UtilityClass.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 4..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define DEVICE_WIDTH                                                [UIScreen mainScreen].bounds.size.width
#define STANDARD_DEVICE_WIDTH                                       414.0f
#define WRATIO_WIDTH(w)                                             (w/3.0f) / STANDARD_DEVICE_WIDTH * DEVICE_WIDTH

#define DEVICE_HEIGHT                                               [UIScreen mainScreen].bounds.size.height
#define STANDARD_DEVICE_HEIGHT                                      736.0f
#define HRATIO_HEIGHT(h)                                            (h/3.0f) / STANDARD_DEVICE_HEIGHT * DEVICE_HEIGHT

#define DEVICE_WIDTH                                                [UIScreen mainScreen].bounds.size.width
#define QUARTER_OF_WIDTH                                            DEVICE_WIDTH/4
#define REMAIN_SPACE                                                414.0f - 353.0f


#define LOGIN_API                                                   @"https://pointapibeta.smtown.com/api/v1/accountSignin"
#define MAIN_API                                                    @"http://pointapibeta.smtown.com/api/v1/main"
#define AUTO_SIGN_IN_API                                            @"http://pointapibeta.smtown.com/api/v1/memberInfo"

typedef NS_ENUM(NSInteger, MenuList)
{
    MenuListPush = 0,
    MenuListEvent,
    MenuListNotice,
    MenuListCustomerCenter,
    MenuListAgreement,
    MenuListUserInfo,
    MenuListVersionNum,
    
};

typedef NS_ENUM(NSInteger, CardList)
{
    CardListRegNewCard = 0,
    CardListChangePw,
    CardListReportCardLoss,
    CardListRegCode,
};


@interface UtilityClass : UIViewController

-(NSString *)getNameOfTheImageWithUrl:(NSString *)urlString;
-(CGFloat)getScreenWidth;
-(UIColor *)getColorWithRGBCode:(NSString *)code;
-(id)getValueWithKey:(NSString *)key Dictionary:(NSDictionary *)dic;
-(void)setContentViewLayoutWithSubView:(UIView *)subView withTargetView:(UIView *)targetView;
-(void)setContentViewLayoutWithSubView2:(UIView *)subView withTargetView:(UIView *)targetView;
-(NSString *)getDeviceLaguage;
-(void)setContentViewLayoutWithSubView3:(UIView *)subView withTargetView:(UIView *)targetView;


@end
