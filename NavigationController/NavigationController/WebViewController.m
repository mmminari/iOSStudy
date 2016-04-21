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
    
    [self urlRequestWithURL:@"http://www.smtown.com"];

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
    
    NSLog(@"%@", request.URL);

    return YES;
    
}

#pragma mark - UIWebView

-(void)urlRequestWithURL:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.showWebSite loadRequest:request];
    
}


@end
