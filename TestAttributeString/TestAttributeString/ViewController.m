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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
    NSString *templetSentenceEng = @"니ㅏㅇ러ㅣ나ㅓㅇㄹ %s1.ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹ ㄴㅇㄹㄴㅇㄹ";
    
    templetSentenceEng = [templetSentenceEng stringByReplacingOccurrencesOfString:@"%s1" withString:userNameEng];

    
    
    NSMutableAttributedString *engName = [[NSMutableAttributedString alloc]initWithString:templetSentenceEng];
    
    NSRange nameRangeEng = [templetSentenceEng rangeOfString:userNameEng];

    [engName addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(nameRangeEng.location, userNameEng.length)];
    
    self.nameLabel.attributedText = korName;
    self.nameLabelEng.attributedText = engName;
    
    
    
     
    
    
    
                           
                           
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
