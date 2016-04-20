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

- (IBAction)backButton:(UIButton *)sender;
- (IBAction)forwardButton:(UIButton *)sender;
- (IBAction)refreshButton:(UIButton *)sender;

@end

@implementation WebViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self.showWebSite reload];

    self.activityIndicator.hidesWhenStopped = YES;
    [self.activityIndicator startAnimating];
    
    NSString *urlString = @"http://www.smtown.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.showWebSite loadRequest:request];
    
    
    if(self.showWebSite.loading)
        NSLog(@"loadinggg");
     else
        [self.activityIndicator stopAnimating];
    

    
}

- (IBAction)backButton:(UIButton *)sender {
    [self.showWebSite goBack];
    
    
}

- (IBAction)forwardButton:(UIButton *)sender {
    [self.showWebSite goForward];
    
    
}

- (IBAction)refreshButton:(UIButton *)sender {
    [self.showWebSite reload];
    
    
}
@end
