//
//  PointViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "BaseViewController.h"
#import "MainViewController.h"


@interface PointViewController :  BaseViewController <WKUIDelegate, WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *wvPoint;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndic;

@property (strong, nonatomic) WKWebView *wkWebView;


@end
