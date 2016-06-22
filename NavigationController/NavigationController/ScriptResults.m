//
//  ScriptResults.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ScriptResults.h"

@implementation ScriptResults


-(instancetype)initWithScriptResults:(id)results
{
    if(self = [super init])
    {
        
        NSDictionary *resultsDic = [NSJSONSerialization JSONObjectWithData:[(NSString *)results dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
        _type = [self getValueWithKey:@"type" Dictionary:resultsDic];
        _action = [self getValueWithKey:@"action" Dictionary:resultsDic];
        _naviTitle = [self getValueWithKey:@"title" Dictionary:resultsDic];
        _url = [self getValueWithKey:@"url" Dictionary:resultsDic];
        _param = [self getValueWithKey:@"param" Dictionary:resultsDic];
        
        LogYellow(@"script results : %@", _type);
        
    }
    
    return self;
}

@end
