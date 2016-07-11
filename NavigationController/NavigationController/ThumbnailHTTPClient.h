//
//  ThumbnailHTTPClient.h
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 11..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface ThumbnailHTTPClient : AFHTTPRequestOperationManager

-(instancetype)initWithBaseURL;
-(void)GETWithUrlString:(NSString *)urlString parameters:(id)parameters
                success:(void (^)(id results))success
                failure:(void (^)(NSError *error))failure;

@end
