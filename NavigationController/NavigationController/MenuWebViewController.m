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
#import "ShowMenuViewController.h"

@interface MenuWebViewController () <WKWebViewClassDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *wvMenu;
@property (strong, nonatomic) WKWebView *wkWebView;

@property (strong, nonatomic) WebViewClass *webView;

@end

@implementation MenuWebViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    if(self.library.scriptResults)
    {
        [self urlRequestWithUrl:[self.library.scriptResults url]];
    }
}

-(WebViewClass *)webView
{
    if(!_webView)
    {
        _webView = [[WebViewClass alloc]initWithDelegate:self];
        _webView.scrollView.delegate = self;
        [self.view addSubview:self.webView];
        [self.util setContentViewLayoutWithSubView3:self.webView withTargetView:self.view];
    }
    
    return _webView;
}

#pragma mark - WKWebViewClassDelegate

-(void)webViewDidFinish:(WKWebViewClass *)webView
{
    [self.webView sendDeviceInfoWithCallScript];
}

-(void)didReceiveScriptResults:(id)results
{
    LogGreen(@"results : %@", results);
    ScriptResults *scriptResults = nil;
    
    if(results)
    {
        scriptResults = [[ScriptResults alloc]initWithScriptResults:results];
        
        self.library.scriptResults = scriptResults ;
    }
    
    MenuWebViewController *menuWebViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-menuWebView"];
    
    [menuWebViewController setCustomNavigationBarWithTitle:self.library.scriptResults.naviTitle];
    
    if ([scriptResults.type isEqualToString:@"modal"])
    {
        if ([scriptResults.action isEqualToString:@"open"])
        {
            [self.navigationController presentViewController:menuWebViewController animated:YES completion:nil];
        }
        else
        {
            self.library.scriptResults = nil;
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
    
    if ([scriptResults.type isEqualToString:@"navi"])
    {
        if ([scriptResults.action isEqualToString:@"open"])
        {
            [self.navigationController showViewController:menuWebViewController sender:nil];
        }
        else
        {
            self.library.scriptResults = nil;
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

#pragma mark - private method

-(void)urlRequestWithUrl:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest  *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}



@end
