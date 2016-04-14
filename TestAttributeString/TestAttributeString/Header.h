//
//  Header.h
//  TestAttributeString
//
//  Created by 김민아 on 2016. 4. 14..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ContainerView.m"

@interface ContainerView : UIViewController<UITextFieldDelegate>



@property (strong, nonatomic) IBOutlet UITextField *inputPhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *inputEmail;

- (IBAction)showData:(UIButton *)sender;

@end

