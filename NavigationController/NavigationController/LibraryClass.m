//
//  LibraryClass.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved. 
//

#import "LibraryClass.h"
#import <AFNetworking/AFNetworking.h>
#import "HTTPClient.h"

@interface LibraryClass ()

@property (strong, nonatomic) HTTPClient *httpClient;


@end


@implementation LibraryClass


//싱글톤
+ (instancetype)sharedInstance
{
    static LibraryClass *_sharedInstance = nil;

    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryClass alloc] init];
 
    });
    
    return _sharedInstance;
}

-(instancetype)init
{
    if(self = [super init])
    {
        _httpClient = [[HTTPClient alloc]initWithBaseURL];
    }
    
    return self;
}


-(void)getMainInformationWithParam:(id)param
                           success:(void (^)(id results))success
                           failure:(void (^)(NSError *error))failure
{
    [self.httpClient GETWithUrlString:@"/api/v1/main" parameters:param success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)getUserInformationWithParam:(id)param
                           success:(void (^)(id results))success
                           failure:(void (^)(NSError *error))failure
{
    [self.httpClient GETWithUrlString:@"/api/v1/memberInfo" parameters:param success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)getStoreInformationWithParam:(id)param
                            success:(void (^)(id results))success
                            failure:(void (^)(NSError *error))failure
{
    [self.httpClient GETWithUrlString:@"/api/v1/brand" parameters:param success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)postLogInResultsWithParam:(id)param
                         success:(void (^)(id results))success
                         failure:(void (^)(NSError *error))failure
{
    [self.httpClient POSTWithUrlString:@"/api/v1/accountSignin" parameters:param success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}
-(void)postResultsOfLogOutWithParam:(id)param
                            success:(void (^)(id results))success
                            failure:(void (^)(NSError *error))failure
{
    [self.httpClient POSTWithUrlString:@"/api/v1/accountSignOut" parameters:param success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)postAlbumCodeWithParam:(id)param
                      success:(void (^)(id results))success
                      failure:(void (^)(NSError *error))failure
{
    [self.httpClient POSTWithUrlString:@"/api/v1/pointAlbum" parameters:param success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)putCardNumWithParam:(id)param
                   success:(void (^)(id results))success
                   failure:(void (^)(NSError *error))failure
{
    [self.httpClient PUTWithUrlString:@"/api/v1/cardSet" parameters:param success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)patchCardPwWithParam:(id)param
                    success:(void (^)(id results))success
                    failure:(void (^)(NSError *error))failure
{
    [self.httpClient PATCHWithUrlString:@"/api/v1/cardPassword" parameters:param success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

-(void)patchCardLossWithParam:(id)param
                      success:(void (^)(id results))success
                      failure:(void (^)(NSError *error))failure
{
    [self.httpClient PATCHWithUrlString:@"/api/v1/cardLoss" parameters:param success:^(id results) {
        if(success)
        {
            success(results);
        }
    } failure:^(NSError *error) {
        if(failure)
        {
            NSLog(@"%@", error);
        }
    }];
}

@end
