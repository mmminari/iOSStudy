//
//  ThumbnailHTTPClient.m
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 11..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ThumbnailHTTPClient.h"

@implementation ThumbnailHTTPClient

-(instancetype)initWithBaseURL
{
    if(self = [super initWithBaseURL:[NSURL URLWithString:@"https://api.flickr.com"]])
    {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        
        
    }
    
    return self;
    
}

-(void)GETWithUrlString:(NSString *)urlString parameters:(id)parameters
                success:(void (^)(id results))success
                failure:(void (^)(NSError *error))failure
{
    [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if(failure)
        {
            failure(error);
        }
    }];
}
@end
