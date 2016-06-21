//
//  WebViewClass.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "BaseViewController.h"
#import "WKWebViewClass.h"



@interface WebViewClass :  WKWebViewClass <WKUIDelegate, WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *wkWebView;

-(void)sendDeviceInfoWithCallScript;

@end
