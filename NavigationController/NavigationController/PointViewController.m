//
//  PointViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "PointViewController.h"

@interface PointViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *wvPoint;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndic;


@end

@implementation PointViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self urlRequestWithURL:@"http://naver.com"];
    [self.activityIndic startAnimating];
    
}



-(void)urlRequestWithURL:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.wvPoint loadRequest:request];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndic stopAnimating];
    self.activityIndic.hidesWhenStopped = YES;

}


@end
