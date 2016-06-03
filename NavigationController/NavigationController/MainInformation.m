//
//  MainInformation.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 1..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainInformation.h"

@implementation MainInformation

-(instancetype)initWithResults:(NSDictionary *)results lagCode:(NSString *)lagCode
{
    if(self = [super init])
    {
        _eventTitle = [self getValueWithKey:lagCode Dictionary:[self getValueWithKey:@"title" Dictionary:[self getValueWithKey:@"textEvent" Dictionary:results]]];
        _bannerUri = [self getValueWithKey:@"uri" Dictionary:[self getValueWithKey:@"banner" Dictionary:[self getValueWithKey:@"imageEvent" Dictionary:results]]];
    }
    
    
    return self;

}

@end
