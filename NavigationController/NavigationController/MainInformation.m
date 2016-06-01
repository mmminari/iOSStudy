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
        _eventTitle = [[[results objectForKey:@"textEvent"]objectForKey:@"title"] objectForKey:lagCode];
        _bannerUri = [[[results objectForKey:@"imageEvent"] objectForKey:@"banner"] objectForKey:@"uri"];
    }
    
    
    return self;

}

@end
