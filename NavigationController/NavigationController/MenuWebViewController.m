//
//  MenuWebViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuWebViewController.h"
#import "WebViewClass.h"
#import "ScriptResults.h"
#import "ModalWebViewController.h"

@interface MenuWebViewController () <WKWebViewClassDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *wvMenu;
@property (strong, nonatomic) WKWebView *wkWebView;

@property (strong, nonatomic) WebViewClass *webView;
@property (strong, nonatomic) ModalWebViewController *modalVC;


@end

@implementation MenuWebViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    self.modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-modalWebView"];
    

}

-(WebViewClass *)webView
{
    if(!_webView)
    {
        _webView = [[WebViewClass alloc]initWithDelegate:self];
        _webView.scrollView.delegate = self;
        [self.view addSubview:self.webView];
        [self.util setContentViewLayoutWithSubView:self.webView withTargetView:self.view];
        
    }
    
    return _webView;
}


-(void)webViewDidFinish:(WKWebViewClass *)webView
{
    [self.webView sendDeviceInfoWithCallScript];
    
}

-(void)didReceiveScriptResults:(id)results
{
    LogGreen(@"results : %@", results);
    if(results)
    {
        ScriptResults *scriptResults = [[ScriptResults alloc]initWithScriptResults:results];
        self.library.scriptResults = scriptResults ;
    }
    
    [self.navigationController showDetailViewController:self.modalVC sender:self];
    
    
}

-(void)urlRequestWithUrl:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest  *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}



@end
