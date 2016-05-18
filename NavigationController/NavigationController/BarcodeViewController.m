//
//  BarcodeViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "BarcodeViewController.h"


@interface BarcodeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbShow;

@end


@implementation BarcodeViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSMutableString *barcodeNum = [NSMutableString stringWithString:self.barString];
    [barcodeNum insertString:@" " atIndex:4];
    [barcodeNum insertString:@" " atIndex:9];
    [barcodeNum insertString:@" "  atIndex:14];
    self.lbShow.text = barcodeNum;
    
    
}

- (IBAction)touchedGoBack:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
    
}


@end
