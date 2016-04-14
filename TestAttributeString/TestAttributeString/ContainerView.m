//
//  ContainerView.m
//  TestAttributeString
//
//  Created by 김민아 on 2016. 4. 14..
//  Copyright © 2016년 김민아. All rights reserved.
//
#import "Header.h"
#import <Foundation/Foundation.h>

@interface ContainerView ()




@end


@implementation ContainerView

typedef NS_ENUM(NSInteger, textFieldNumber){
    textFieldNumberPhoneNumber = 2000,
    textFieldNumberEmail,
};

-(void)viewDidLoad{
    self.inputPhoneNumber.tag = textFieldNumberPhoneNumber;
    self.inputEmail.tag = textFieldNumberEmail;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    if(textField.tag == textFieldNumberPhoneNumber) {
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    }
    if (textField.tag == textFieldNumberEmail){
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
    }

    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [[event allTouches] anyObject];

    if ([self.inputPhoneNumber isFirstResponder] && [touch view] != self.inputPhoneNumber) {
        [self.inputPhoneNumber resignFirstResponder];
    }
    if ([self.inputEmail isFirstResponder] && [touch view] != self.inputEmail) {
        [self.inputEmail resignFirstResponder];
    }
}




- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if(textField.tag == textFieldNumberPhoneNumber){
        self.view.frame = CGRectMake(0, -150, self.view.frame.size.width, self.view.frame.size.height);
    }
    if (textField.tag == textFieldNumberEmail){
        self.view.frame = CGRectMake(0, -150, self.view.frame.size.width, self.view.frame.size.height);
        
    }
    
    return YES  ;
    
}




- (IBAction)showData:(UIButton *)sender {
}
@end