//
//  WebViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIWebView *showWebSite;


@end

@implementation WebViewController

#pragma mark - View lifecycle

-(void)viewDidLoad{
    [super viewDidLoad];


    self.activityIndicator.hidesWhenStopped = YES;
    [self.activityIndicator startAnimating];
    
    // https://memberbeta.smtown.com/Account/SignIn?returnUrl=%2fMy%2fPassport
    // https://memberbeta.smtown.com
    [self urlRequestWithURL:@"https://memberbeta.smtown.com/Account/SignIn?returnUrl=%2fMy%2fPassport"];

}

#pragma mark - User Action

- (IBAction)touchedBackButton:(id)sender {
    
    [self.showWebSite goBack];
    
}

- (IBAction)touchedForwardButton:(id)sender {
    
    [self.showWebSite goForward];
    
}

- (IBAction)touchedRefreshButton:(id)sender {
    
    [self.showWebSite reload];
    
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activityIndicator stopAnimating];
    
}

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"URL: %@", request.URL.absoluteString);
    /*
    NSLog(@"CachePolicy : %lu", (unsigned long)request.cachePolicy);
    NSLog(@"TimeOutInterval : %f", request.timeoutInterval);
    NSLog(@"%@", request.mainDocumentURL.absoluteString);
    NSLog(@"NetworkServiceType : %lu", (unsigned long)request.networkServiceType);
    NSLog(@"HTTPBody : %lu", request.HTTPBody.length);
    NSLog(@"HTTPBody : %@", request.HTTPBodyStream);
    NSLog(@"HTTPMethod : %@", request.HTTPMethod);
    */
    
    
    // 도메인
    NSLog(@"Domain : %@ ", request.URL.host );
    
    // 상대경로
    NSLog(@"Relative Path : %@ ", request.URL.relativePath);
    
    // Query (Parameters)
    NSLog(@"Query : %@ ", request.URL.query);

    
    // returnUrl value?
    NSLog(@"Value : %@ ", [self getValueFromUrlWithRequest:request]);

    
    NSString *testURLString = @"https://memberbeta.smtown.com/Account/SignIn?returnUrl=%2fMy%2fPassport&key1=value1&key2=value2";
    NSURL *testURL = [NSURL URLWithString:testURLString];
    
    
    [self getValueFromURL:testURL withKey:@"key2"];
    
    
    return YES;
    
}

#pragma mark - UIWebView

-(void)urlRequestWithURL:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.showWebSite loadRequest:request];
    
}

#pragma mark - Get Value From Url

-(NSString *)getValueFromUrlWithRequest:(NSURLRequest *)request
{
    
    NSString *result = nil;
    
    NSString *query = request.URL.query;
    
    NSArray *queryArr = [query componentsSeparatedByString:@"="];
    
    result = queryArr[1];
    
    return result;
}

- (NSString *)getValueFromURL:(NSURL *)url withKey:(NSString *)key
{
    NSString *result = nil;
    
    NSString *queryString = url.query;
    
    NSArray *keyAndValues = [queryString componentsSeparatedByString:@"&"];
    
    NSMutableDictionary *dicKeyAndValues = [NSMutableDictionary dictionary];
    
    NSInteger index = 0;
    for (NSString *keyAndValue in keyAndValues)
    {
        NSLog(@"keyAndValue[%zd] : %@",index, keyAndValue);
        
        NSArray *tempKV = [keyAndValue componentsSeparatedByString:@"="];
        
        [dicKeyAndValues setObject:[tempKV lastObject] forKey:[tempKV firstObject]];
        NSLog(@"dicKeyAndValues[%zd] : %@",index, dicKeyAndValues);
        
        index++;
    }
    
    result = [dicKeyAndValues valueForKey:key];
    NSLog(@"result : %@",result);
    
    
    return result;
}


@end
