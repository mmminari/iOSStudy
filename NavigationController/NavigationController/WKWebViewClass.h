//
//  WKWebViewClass.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <WebKit/WebKit.h>

//delegate선언
//여기서 무언가 액션을 받아 실행할 메소드를 다음 딜리게이트를 선언해주고 함수도 선언해 준 뒤 사용하면 된다.
@protocol WKWebViewClassDelegate;


@interface WKWebViewClass : WKWebView

@property (weak, nonatomic) id<WKWebViewClassDelegate> webDelegate;


-(instancetype)initWithDelegate:(id<WKWebViewClassDelegate, UIScrollViewDelegate>)delegate;

-(instancetype)initWithDelegate:(id<WKWebViewClassDelegate, UIScrollViewDelegate>)delegate
   configurationWithHandlerName:(NSString *)handlerName;
-(void)executeJavaScript:(NSString *)script;

@end

//delegate내용들 기본값은 required
@protocol WKWebViewClassDelegate <NSObject>

-(void)webViewDidFinish:(WKWebViewClass *)webView;
-(void)didReceiveScriptResults:(id)results;

@end