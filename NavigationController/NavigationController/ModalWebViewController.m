//
//  ModalWebViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ModalWebViewController.h"
#import "WebViewClass.h"
#import "ShowMenuViewController.h"

@interface ModalWebViewController () <WKWebViewClassDelegate, UIScrollViewDelegate>
@property (strong, nonatomic) WebViewClass *webView;
@property (strong, nonatomic) ShowMenuViewController *naviVC;

@end

@implementation ModalWebViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.naviVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view addSubview:self.naviVC.view];
    [self.util setContentViewLayoutWithSubView2:self.naviVC.view withTargetView:self.view];
    self.naviVC.ivBack.image = [UIImage imageNamed:@"btn_popup_close"];
    self.naviVC.baseVC = self;
    [self.naviVC.btnDismiss setHidden:NO];

}


-(void)viewWillAppear:(BOOL)animated
{
    [self urlRequestWithUrl:[self.library.scriptResults url]];
    self.naviVC.lbTitle.text =[self.library.scriptResults naviTitle];
    
    
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

-(void)urlRequestWithUrl:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest  *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}


@end
