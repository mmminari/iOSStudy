//
//  MainInformation.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 1..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainInformation.h"

@implementation MainInformation


-(void)initWithResults:(NSDictionary *)results
{
    self.introInfoArr = [self getValueWithKey:@"introInfo" Dictionary:results];
    self.introInformationArr = [NSMutableArray array];
    
    for (NSDictionary *dic in self.introInfoArr)
    {
        self.introInfo = [[IntroInformation alloc]initWithInfoDic:dic];
        [self.introInformationArr addObject:self.introInfo];
    }
    NSLog(@"introArr: %@", self.introInformationArr);
    
    _eventTitle = [[[results objectForKey:@"textEvent"]objectForKey:@"title"]objectForKey:@"ko"];
    _bannerUri = [[[results objectForKey:@"imageEvent"] objectForKey:@"banner"]objectForKey:@"uri"];
    
}

@end
