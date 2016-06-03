//
//  BaseModel.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(id)getValueWithKey:(NSString *)key Dictionary:(NSDictionary *)dic
{
    id result = nil;
    
    id value = [dic objectForKey:key];
    if([value isKindOfClass:[NSNull class]])
    {
        result = nil;
    }
    else
    {
        result = value;
    }
    
    return result;
    
}

@end
