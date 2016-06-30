//
//  StoreCell.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 18..
//  Copyright © 2016년 김민아. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "StoreCell.h"

@implementation StoreCell

- (IBAction)touchedToMakeACall:(id)sender
{
    //버튼이 눌렸을 때 통화로 넘어가는 부분
    NSString *format = @"tel://";
    NSString *num = self.lbPhoneNum.text;
    format = [format stringByAppendingString:num];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"전화걸기" message:num preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:format]];
    }];
    
    [alert addAction:defaultAction];
    [self.storeVC presentViewController:alert animated:YES completion: nil];
}

- (IBAction)touchedGoToMap:(id)sender
{
    [self.mainVC.navigationController showViewController:self.mapVC sender:self];
    LogYellow(@"mapmap");
}



@end

