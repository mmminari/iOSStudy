//
//  LibraryClass.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved. 
//

#import "LibraryClass.h"

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


-(void)initWithResults:(NSDictionary *)results
{

    _eventTitle = [[[results objectForKey:@"textEvent"]objectForKey:@"title"]objectForKey:@"ko"];
    _bannerUri = [[[results objectForKey:@"imageEvent"] objectForKey:@"banner"]objectForKey:@"uri"];

}

@end
