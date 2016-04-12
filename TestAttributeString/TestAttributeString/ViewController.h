//
//  ViewController.h
//  TestAttributeString
//
//  Created by 김민아 on 2016. 4. 12..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabelEng;

@property (strong, nonatomic) IBOutlet UITextField *inputName;
@property (strong, nonatomic) IBOutlet UITextField *inputAge;
@property (strong, nonatomic) IBOutlet UITextField *inputHobby;

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userAge;
@property (strong, nonatomic) NSString *userHobby;

@property (strong, nonatomic) IBOutlet UILabel *showLabel;


@property( strong, nonatomic) NSMutableAttributedString *finalIntro;

- (IBAction)show:(UIButton *)sender;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;

@end

