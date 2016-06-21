//
//  WKWebViewClass.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <WebKit/WebKit.h>

@protocol WKWebViewClassDelegate;


@interface WKWebViewClass : WKWebView

@property (weak, nonatomic) id<WKWebViewClassDelegate> webDelegate;


-(instancetype)initWithDelegate:(id<WKWebViewClassDelegate, UIScrollViewDelegate>)delegate;

-(instancetype)initWithDelegate:(id<WKWebViewClassDelegate, UIScrollViewDelegate>)delegate
   configurationWithHandlerName:(NSString *)handlerName;
-(void)executeJavaScript:(NSString *)script;



@end


@protocol WKWebViewClassDelegate <NSObject>

-(void)webViewDidFinish:(WKWebViewClass *)webView;
-(void)didReceiveScriptResults:(id)results;




@end