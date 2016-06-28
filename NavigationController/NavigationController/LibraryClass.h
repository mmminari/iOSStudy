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
#import "PushModel.h"
#import "GenerateBarcode.h"
#import "ScriptResults.h"

@interface LibraryClass : NSObject


+ (instancetype)sharedInstance;

@property (strong, nonatomic) UserInformation *userInfo;
@property (strong, nonatomic) MainInformation *mainInfo;
@property (strong, nonatomic) ScriptResults *scriptResults;


@property (assign, nonatomic) BOOL launchOption;

@property (strong, nonatomic) PushModel *pushModel;

-(UIImage *)genergateBarcodeWithCode:(NSString *)barString;
-(UIImage *)generateVerticalBarcodeImgWithBarcode:(NSString *)barcode;

-(void)requestProfileImageWithSuccess:(void (^)(id results))success
                              failure:(void (^)(NSError *error))failure
                            imageInfo:(NSData *)imageData;

-(void)requestMainInformationWithParameter:(id)parameter
                                   success:(void (^)(id results))success
                                   failure:(void (^)(NSError *error))failure;

-(void)requestUserInformationWithParameter:(id)parameter
                                   success:(void (^)(id results))success
                                   failure:(void (^)(NSError *error))failure;

-(void)requestStoreInformationWithParameter:(id)parameter
                                    success:(void (^)(id results))success
                                    failure:(void (^)(NSError *error))failure;

-(void)requestLogInWithParameter:(id)parameter
                         success:(void (^)(id results))success
                         failure:(void (^)(NSError *error))failure;

-(void)requestLogOutWithParameter:(id)parameter
                          success:(void (^)(id results))success
                          failure:(void (^)(NSError *error))failure;

-(void)requestRegisterAlbumCodeWithParameter:(id)parameter
                                     success:(void (^)(id results))success
                                     failure:(void (^)(NSError *error))failure;

-(void)requestRegisterCardNumWithParameter:(id)parameter
                                   success:(void (^)(id results))success
                                   failure:(void (^)(NSError *error))failure;

-(void)requestChangeCardPwWithParameter:(id)parameter
                                success:(void (^)(id results))success
                                failure:(void (^)(NSError *error))failure;

-(void)requestReportCardLossWithParameter:(id)parameter
                                  success:(void (^)(id results))success
                                  failure:(void (^)(NSError *error))failure;

-(void)registerDeviceTokenWithLaunchOptions:(NSDictionary *)launchOptions;

-(void)saveDeviceToken:(NSData *)deviceToken;

-(NSString *)getDeviceToken;

-(void)setPayload:(NSDictionary *)userInfo;

@end
