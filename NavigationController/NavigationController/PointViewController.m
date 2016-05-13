//
//  PointViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "PointViewController.h"

@interface PointViewController ()



@end

@implementation PointViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self urlRequestWithURL:@"http://naver.com"];
    [self.activityIndic startAnimating];
    self.activityIndic.hidesWhenStopped = YES;
    
    
    self.wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    self.wkWebView.UIDelegate = self;
    self.wkWebView.navigationDelegate = self;
    
    [self.view insertSubview:self.wkWebView belowSubview:self.activityIndic];
    
    
    
    NSURL *urlString = [NSURL URLWithString : @"http://daum.net" ];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlString];
    [self.wkWebView loadRequest:request];
 
}

- (void)webView:(WKWebView *)webView
didFinishNavigation:(WKNavigation *)navigation
{
    [self.activityIndic stopAnimating];

}


-(void)urlRequestWithURL:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.wvPoint loadRequest:request];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //[self.activityIndic stopAnimating];

}





@end
