//
//  ViewController.m
//  TestAttributeString
//
//  Created by 김민아 on 2016. 4. 12..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


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
    
    self.inputName.tag = 0;
    self.inputAge.tag = 1;
    self.inputHobby.tag = 2;
    
    
    if(textField.tag == 0)
    {
        if((range.length != 1) && (self.inputName.text.length> 10 - 1))
        {
           
            [self showErrorMessageWithtextField:self.inputName];
            
        }
    
    }
    
    if(textField.tag == 1)
    {
        if((range.length != 1) && (self.inputAge.text.length>2 -1))
        {
            
            [self showErrorMessageWithtextField:self.inputAge];
      
        }
    }
    
    if(textField.tag == 2)
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    if(textField == self.inputHobby){
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
    
    
    
    
    
    
    
    
    
    
    
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showLabel.text = @" "  ;
    
    

    
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
