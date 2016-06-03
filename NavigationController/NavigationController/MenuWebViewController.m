//
//  MenuWebViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuWebViewController.h"

@interface MenuWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *wvMenu;

@end

@implementation MenuWebViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
  //  [self urlRequestWithUrl:self.urlString];
    
}

-(void)urlRequestWithUrl:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest  *request = [NSURLRequest requestWithURL:url];
    [self.wvMenu loadRequest:request];
    
}



@end
