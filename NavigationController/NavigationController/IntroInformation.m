//
//  IntroInformation.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 8..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "IntroInformation.h"

@implementation IntroInformation


-(instancetype)initWithInfoDic:(NSDictionary *)results
{
    if(self = [super init])
    {
        _backgroundWidth = [[self getValueWithKey:@"width" Dictionary:[self getValueWithKey:@"background" Dictionary:results]] intValue];
        _backgroundHeight = [[self getValueWithKey:@"height" Dictionary:[self getValueWithKey:@"background" Dictionary:results]] intValue];
        _backgroundUri = [self getValueWithKey:@"uri" Dictionary:[self getValueWithKey:@"background" Dictionary:results]];
        
        _contentWidth = [[self getValueWithKey:@"width" Dictionary:[self getValueWithKey:@"content" Dictionary:results]] intValue];
        _contentHeight = [[self getValueWithKey:@"height" Dictionary:[self getValueWithKey:@"content" Dictionary:results]] intValue];
        _contentUri = [self getValueWithKey:@"uri" Dictionary:[self getValueWithKey:@"background" Dictionary:results]];
        
        _contentBackgroundWidht = [[self getValueWithKey:@"width" Dictionary:[self getValueWithKey:@"content_background" Dictionary:results]] intValue];
        _contentBackgroundHeight = [[self getValueWithKey:@"height" Dictionary:[self getValueWithKey:@"content_background" Dictionary:results]] intValue];
        _contentBackgroundUri = [self getValueWithKey:@"uri" Dictionary:[self getValueWithKey:@"background" Dictionary:results]];
        
    }
    
    return self;
}


@end
