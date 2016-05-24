//
//  ShowMenuViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 23..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ShowMenuViewController.h"


@interface ShowMenuViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;

@end

@implementation ShowMenuViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.lbTitle.text = self.title;
    
}


@end
