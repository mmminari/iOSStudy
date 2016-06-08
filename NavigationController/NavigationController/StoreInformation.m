//
//  StoreInformation.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 18..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "StoreInformation.h"

@interface StoreInformation ()

@end

@implementation StoreInformation


-(instancetype)initWithResults:(NSDictionary*)results
{
    if(self = [super init])
    {
        _name =  [self getValueWithKey:@"ko" Dictionary:[self getValueWithKey:@"name" Dictionary:results]];
        _address = [self getValueWithKey:@"ko" Dictionary:[self getValueWithKey:@"address" Dictionary:results]];
        _saleInfo = [self getValueWithKey:@"ko" Dictionary:[self getValueWithKey:@"saleInfo" Dictionary:results]];
        _explain = [self getValueWithKey:@"ko" Dictionary:[self getValueWithKey:@"explain" Dictionary:results]];
        _phone = [self getValueWithKey:@"phone" Dictionary:results];
        _imageInfoUri = [self getValueWithKey:@"uri" Dictionary:[self getValueWithKey:@"imageInfo" Dictionary:results]];
        _imageInfoHeight = [self getValueWithKey:@"height" Dictionary:[self getValueWithKey:@"imageInfo" Dictionary:results]];
        _imageInfoWidth = [self getValueWithKey:@"width" Dictionary:[self getValueWithKey:@"imageInfo" Dictionary:results]];
    }
    
    return self;
}

@end
