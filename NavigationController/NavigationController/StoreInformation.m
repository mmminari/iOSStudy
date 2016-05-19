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
       
        _name = [[results objectForKey:@"name"]objectForKey:@"ko"];
        _address = [[results objectForKey:@"address"]objectForKey:@"ko"];
        _saleInfo = [[results objectForKey:@"saleInfo"]objectForKey:@"ko"];
        _explain = [[results objectForKey:@"explain"]objectForKey:@"ko"];
        _phone = [results objectForKey:@"phone"];
        _imageInfoUri = [[results objectForKey:@"imageInfo"]objectForKey:@"uri"];
        
    }
    
    return self;
    
}

@end
