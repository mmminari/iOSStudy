//
//  WebViewClass.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "WebViewClass.h"
#define kHandlerName                                @"handlerForApp"


@interface WebViewClass () <UIScrollViewDelegate>

@end

@implementation WebViewClass

-(instancetype)initWithDelegate:(id<WKWebViewClassDelegate>)delegate
{
    self = [super initWithDelegate:delegate configurationWithHandlerName:kHandlerName];
    
    if(self)
    {
        
    }
    
    return self;
    
}

-(void)sendDeviceInfoWithCallScript
{
    [self executeJavaScript:@"setupWebViewJavascriptBridge('ios')"];
    
}


@end
