//
//  MainInformation.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 1..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainInformation.h"

@implementation MainInformation


-(instancetype)initWithResults:(id)results
{
    if(self = [super init])
    {
        if ([results isKindOfClass:[NSDictionary class]])
        {
            NSArray *list = [self getValueWithKey:@"introInfo" Dictionary:results];
            NSMutableArray *listArr = [NSMutableArray array];
            
            for (NSDictionary *dic in list)
            {
                IntroInformation *introInfo = [[IntroInformation alloc]initWithInfoDic:dic];
                [listArr addObject:introInfo];
            }
            
            self.introList = (NSArray *)listArr;
            NSLog(@"introList %@", self.introList);
        }
        
        _eventTitle = [[[results objectForKey:@"textEvent"]objectForKey:@"title"]objectForKey:@"ko"];
        _bannerUri = [[[results objectForKey:@"imageEvent"] objectForKey:@"banner"]objectForKey:@"uri"];
    }
    
    
    
    return self;
}

@end
