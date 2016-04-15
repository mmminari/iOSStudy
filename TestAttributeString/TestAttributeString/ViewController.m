//
//  ViewController.m
//  TestAttributeString
//
//  Created by 김민아 on 2016. 4. 12..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ViewController.h"

#define KEYBOARD_HEIGHT                                         250.0f

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabelEng;

@property (strong, nonatomic) IBOutlet UITextField *inputName;
@property (strong, nonatomic) IBOutlet UITextField *inputAge;
@property (strong, nonatomic) IBOutlet UITextField *inputHobby;
@property (strong, nonatomic) IBOutlet UITextField *inputPhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *inputEmail;

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userAge;
@property (strong, nonatomic) NSString *userHobby;

@property (strong, nonatomic) IBOutlet UILabel *showLabel;


@property( strong, nonatomic) NSMutableAttributedString *finalIntro;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfSubContainer;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfHideButton;

@property (strong, nonatomic) IBOutlet UIView *subView;
@property (strong, nonatomic) IBOutlet UIButton *hideButton;

@end

@implementation ViewController

typedef NS_ENUM(NSInteger, textFieldTagNumber){
    textFieldTagNumberName = 1000,
    textFieldTagNumberAge,
    textFieldTagNumberHobby,
    textFieldTagNumberPhoneNumber,
    textFieldTagNumberEmail,
};


-(void)showErrorMessageWithtextField:(UITextField *)textField{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:@"exceed the input limit"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) { textField.text = @""; }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    
    
    if(textField.tag == textFieldTagNumberName)
    {
        if((range.length != 1) && (self.inputName.text.length> 10 - 1))
        {
           
            [self showErrorMessageWithtextField:self.inputName];
            
        }
    
    }
    
    if(textField.tag == textFieldTagNumberAge)
    {
        if((range.length != 1) && (self.inputAge.text.length>2 -1))
        {
            
            [self showErrorMessageWithtextField:self.inputAge];
      
        }
    }
    
    if(textField.tag == textFieldTagNumberHobby)
    {
        if((range.length != 1) && (self.inputHobby.text.length >10 -1))
        {
            [self showErrorMessageWithtextField:self.inputHobby];
            
        }
    }

    
    return YES;
    
    
}

- (IBAction)show:(UIButton *)sender {
    
    self.userName = self.inputName.text;
    self.userAge = self.inputAge.text;
    self.userHobby  = self.inputHobby.text;
    
    
    
    NSString *introduction = @"제 이름은 %s1 입니다. 나이는 %s2이고, 취미는 %s3 입니다.";
    
    
    introduction = [introduction stringByReplacingOccurrencesOfString:@"%s1" withString:self.userName];
    introduction = [introduction stringByReplacingOccurrencesOfString:@"%s2" withString:self.userAge];
    introduction = [introduction stringByReplacingOccurrencesOfString:@"%s3" withString:self.userHobby];
    
    
    self.finalIntro = [[NSMutableAttributedString alloc] initWithString:introduction];
    
    NSLog(@"final %@", self.finalIntro);
    
    NSRange nameRange = [introduction rangeOfString:self.userName];
    NSRange ageRange = [introduction rangeOfString:self.userAge];
    NSRange hobbyRange = [introduction rangeOfString:self.userHobby];
    
    
    [self.finalIntro addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(nameRange.location, self.userName.length)];
    [self.finalIntro addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20.0f] range:NSMakeRange(nameRange.location, self.userName.length)];
    
    [self.finalIntro addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16.0f] range:NSMakeRange(ageRange.location, self.userAge.length)];
    
    [self.finalIntro addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16.0f] range:NSMakeRange(hobbyRange.location, self.userHobby.length)];
    
    
    self.showLabel.attributedText = self.finalIntro;
    NSLog( @"%@", self.finalIntro);
    
    

}

- (IBAction)hideKeyboard:(UIButton *)sender withTextField:(UITextField *)textField {
    
    
    if ([self.inputName isFirstResponder] ) {
        [self.inputName resignFirstResponder];
    }
    if ([self.inputAge isFirstResponder]) {
        [self.inputAge resignFirstResponder];
    }
    if ([self.inputHobby isFirstResponder]) {
        [self.inputHobby resignFirstResponder];
    }
    if ([self.inputPhoneNumber isFirstResponder]) {
        [self.inputPhoneNumber resignFirstResponder];
    }
    if ([self.inputEmail isFirstResponder] ) {
        [self.inputEmail resignFirstResponder];
        self.alcTopOfSubContainer.constant = CGFLOAT_MIN;
        
    }
    /*
    if([textField isFirstResponder])
        [textField resignFirstResponder];
    */
    
    
    [self.hideButton setHidden:YES];
    

    

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    if(textField.tag == textFieldTagNumberHobby){
        self.userName = self.inputName.text;
        self.userAge = self.inputAge.text;
        self.userHobby  = self.inputHobby.text;
   
        NSString *introduction = @"제 이름은 %s1 입니다. 나이는 %s2이고, 취미는 %s3 입니다.";
        
        
        introduction = [introduction stringByReplacingOccurrencesOfString:@"%s1" withString:self.userName];
        introduction = [introduction stringByReplacingOccurrencesOfString:@"%s2" withString:self.userAge];
        introduction = [introduction stringByReplacingOccurrencesOfString:@"%s3" withString:self.userHobby];
        
        
        self.finalIntro = [[NSMutableAttributedString alloc] initWithString:introduction];
        
        NSLog(@"final %@", self.finalIntro);
        
        NSRange nameRange = [introduction rangeOfString:self.userName];
        NSRange ageRange = [introduction rangeOfString:self.userAge];
        NSRange hobbyRange = [introduction rangeOfString:self.userHobby];
        
        
        [self.finalIntro addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(nameRange.location, self.userName.length)];
        [self.finalIntro addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20.0f] range:NSMakeRange(nameRange.location, self.userName.length)];
        
        [self.finalIntro addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16.0f] range:NSMakeRange(ageRange.location, self.userAge.length)];
        
        [self.finalIntro addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16.0f] range:NSMakeRange(hobbyRange.location, self.userHobby.length)];
        
        
        self.showLabel.attributedText = self.finalIntro;
        NSLog( @"%@", self.finalIntro);


        
    }
    
    [self.hideButton setHidden:YES];
    

    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (textField.tag == textFieldTagNumberEmail)
    {

        self.alcTopOfSubContainer.constant = KEYBOARD_HEIGHT * -1;
    }
    
    [self.hideButton setHidden:NO];
    self.alcBottomOfHideButton.constant = KEYBOARD_HEIGHT *-1;
    
    
    return YES  ;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([self.inputName isFirstResponder] && [touch view] != self.inputName) {
        [self.inputName resignFirstResponder];
    }
    if ([self.inputAge isFirstResponder] && [touch view] != self.inputAge) {
        [self.inputAge resignFirstResponder];
    }
    if ([self.inputHobby isFirstResponder] && [touch view] != self.inputHobby) {
        [self.inputHobby resignFirstResponder];
    }
    if ([self.inputPhoneNumber isFirstResponder] && [touch view] != self.inputPhoneNumber) {
        [self.inputPhoneNumber resignFirstResponder];
    }
    if ([self.inputEmail isFirstResponder] && [touch view] != self.inputEmail) {
        [self.inputEmail resignFirstResponder];
    }
    */
    
    
    self.alcTopOfSubContainer.constant = CGFLOAT_MIN;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.hideButton setHidden:YES];
    

    
    self.view.userInteractionEnabled = YES;

    
    self.inputName.tag = textFieldTagNumberName;
    self.inputAge.tag = textFieldTagNumberAge;
    self.inputHobby.tag = textFieldTagNumberHobby;
    self.inputPhoneNumber.tag = textFieldTagNumberPhoneNumber;
    self.inputEmail.tag = textFieldTagNumberEmail;


    
    self.showLabel.text = @" ";
    
    

    
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    NSString *userName = @"김민아11111";
    NSString *templetSentence = @"내이름은 %s1 입니다.";
    
    templetSentence = [templetSentence stringByReplacingOccurrencesOfString:@"%s1" withString:userName];
    
    NSMutableAttributedString *korName = [[NSMutableAttributedString alloc] initWithString:templetSentence];
    NSRange nameRange = [templetSentence rangeOfString:userName];
    NSLog(@"name.length : %lu",(unsigned long)nameRange.location);
    
    [korName addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(nameRange.location, userName.length)];

    
    // 내이름은 %s1 입니다. - 한
    // My Name is %s1. - 영
    

    NSString *userNameEng = @"Mina";
    NSString *templetSentenceEng = @"My name is %s1";
    
    templetSentenceEng = [templetSentenceEng stringByReplacingOccurrencesOfString:@"%s1" withString:userNameEng];

    
    
    NSMutableAttributedString *engName = [[NSMutableAttributedString alloc]initWithString:templetSentenceEng];
    
    NSRange nameRangeEng = [templetSentenceEng rangeOfString:userNameEng];

    [engName addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(nameRangeEng.location, userNameEng.length)];
    
    self.nameLabel.attributedText = korName;
    self.nameLabelEng.attributedText = engName;
    
    */

    
 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
