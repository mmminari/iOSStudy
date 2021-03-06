//
//  WKWebViewClass.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "WKWebViewClass.h"
#import "AppDelegate.h"
#import "MenuWebViewController.h"

#define kDefaultHandlerName                                                          @"default_handler"

@interface WKWebViewClass () <WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>


@end

@implementation WKWebViewClass


//핸들러 등록, delegate호출
-(instancetype)initWithDelegate:(id<WKWebViewClassDelegate, UIScrollViewDelegate>)delegate configurationWithHandlerName:(NSString *)handlerName
{
    if(self = [super initWithFrame:CGRectZero configuration:[self customConfigurationWithHandlerName:handlerName]])
    {
        [self setUpDelegate:delegate];
    }
    
    return self;
}

-(instancetype)initWithDelegate:(id<WKWebViewClassDelegate, UIScrollViewDelegate>)delegate
{
    if (self = [super initWithFrame:CGRectZero configuration:[self defaultConfiguration]])
    {
        [self setUpDelegate:delegate];
    }
    
    return self;
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    if([self.webDelegate respondsToSelector:@selector(webViewDidFinish:)])
    {
        [self.webDelegate webViewDidFinish:self];
    }
}

#pragma mark - Delegate

-(void)setUpDelegate:(id<WKWebViewClassDelegate, UIScrollViewDelegate>)delegate
{
    self.navigationDelegate = self;
    self.UIDelegate = self;
    
    _webDelegate = delegate;
}

-(void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(nonnull NSString *)message initiatedByFrame:(nonnull WKFrameInfo *)frame completionHandler:(nonnull void (^)(void))completionHandler
{
    LogGreen(@"runJavaScriptAlertPanelWithMessage");
    
    [self showAlertMessage:@"1:1문의가 접수되었습니다." completionHandler:completionHandler];
}

-(void)showAlertMessage:(NSString *)message completionHandler:(void(^)(void))completionHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completionHandler();
    }];
    
    [alert addAction:action];
    
    MenuWebViewController *menuWebVC = (MenuWebViewController *)self.webDelegate;
    [menuWebVC presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - handler

//2. 다바이스에 있는 쿠키를 헤어데 넣기 3. 헨들러등록
-(WKWebViewConfiguration *)customConfigurationWithHandlerName:(NSString *)handlerName
{
    WKUserScript *cookieScript = [[WKUserScript alloc]initWithSource:[self getInjectionCookie] injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
    WKUserContentController *controller = [[WKUserContentController alloc]init];
    
    [controller addScriptMessageHandler:self name:handlerName];
    [controller addUserScript:cookieScript];
    
    configuration.userContentController = controller;
    
    return configuration;
    
}

- (WKWebViewConfiguration *)defaultConfiguration
{
    
    WKUserScript * cookieScript = [[WKUserScript alloc]
                                   initWithSource: [self getInjectionCookie]
                                   injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    
    WKUserContentController *controller = [[WKUserContentController alloc] init];
    
    [controller addScriptMessageHandler:self name:kDefaultHandlerName];
    [controller addUserScript:cookieScript];
    
    configuration.userContentController = controller;
    
    return configuration;
}

//1. web에 현제 플랫폼 보내기(ios)
-(void)executeJavaScript:(NSString *)script
{
    [self evaluateJavaScript:script completionHandler:nil];
}

-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    LogGreen(@"success to receive message : %@", message);
    
    if ([self.webDelegate respondsToSelector:@selector(didReceiveScriptResults:)])
    {
        [self.webDelegate didReceiveScriptResults:message.body];
    }
}

#pragma mark - private method
    
-(NSString *)getInjectionCookie
{
    NSString *result = nil;
    NSArray *allCookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    
    NSMutableString *convertedCookiesString = [NSMutableString new];
    
    for(NSHTTPCookie *cookie in allCookies)
    {
        [convertedCookiesString appendString:[NSString stringWithFormat:@"document.cookie = '%@=%@;domain=%@;';", cookie.name, cookie.value, cookie.domain]];
    }
    
    result = convertedCookiesString;
    
    LogYellow(@"cookieeeee: %@", result)    ;
    
    return result;
    
}
    

@end
