//
//  MenuWebViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <WebKit/WebKit.h>


@interface MenuWebViewController : BaseViewController<WKUIDelegate, WKNavigationDelegate>


@property (strong, nonatomic) NSString *urlString;

-(void)urlRequestWithUrl:(NSString *)urlString;

@end
