//
//  CalculatePercentageViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 5..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "CalculatePercentageViewController.h"

@implementation CalculatePercentageViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *numArr = @[@85556898, @766688, @6764728, @67685757652];
    NSInteger total = 0;
    
    NSMutableArray *finalArr = [NSMutableArray array];
    
    for (NSNumber *num in numArr)
    {
        total = total + [num integerValue];
        NSLog(@"total : %zd", total);
    }
    
    NSMutableArray *percentArr = [NSMutableArray array];
    
    for (NSNumber *num in numArr)
    {
        NSLog(@"percent %f", [num floatValue] / total * 100);
        
        CGFloat percent = [num floatValue] / total * 100;
        if(percent > 98)
        {
            percent = 96;
            
        }
        NSString *percentage = [NSString stringWithFormat:@"%f", percent];
        
        [percentArr addObject:percentage];
        NSLog(@"percentArr : %@", percentArr);
    }
    
    for (int i = 0; i < 4; i ++)
    {
        for(int a = i+1; a <4; a ++)
        {
            NSString *num1 = percentArr[i] ;
            NSString *num2 = percentArr[a];
            
            NSRange range1 = [num1 rangeOfString:@"."];
            NSRange range2 = [num2 rangeOfString:@"."];
            NSLog(@"num %@, range ; %lu", num1, (unsigned long)range1.location);
            NSLog(@"num %@, range ; %lu", num2, (unsigned long)range2.location);
            
            num1 = [num1 substringWithRange:NSMakeRange(range1.location + 1, 1 )];
            num2 = [num2 substringWithRange:NSMakeRange(range2.location + 1, 1 )];
            
            if([num2 intValue] > [num1 intValue])
            {
                NSString *temp = percentArr[i];
                percentArr[i] = percentArr[a];
                percentArr[a] = temp;
                NSLog(@"1 %@, 2 %@", percentArr[i], percentArr[a]);
            }
        }
        
        if(i == 3)
        {
            NSInteger totalNum = 0;
            
            for (NSString *num in percentArr) {
                NSRange range = [num rangeOfString:@"."];
                NSInteger number = [[num substringToIndex:range.location] integerValue];
                totalNum = totalNum + number;
            }
            
            if (totalNum > 100)
            {
                totalNum = totalNum - 100;
                for (int i = (int)totalNum - 1 ; i == 0 ; i --)
                {
                    NSLog(@":  total num : %ld   ", (long)totalNum);
                    NSInteger val = [percentArr[i]integerValue] - 1;
                    percentArr[i] = [NSString stringWithFormat:@"%zd", val];
                }
            }
            else
            {
                totalNum = 100 - totalNum;
                for(int i = 0; i < totalNum; i ++)
                {
                    NSLog(@"percentage: %ld total num : %ld   ",(long)[percentArr[i]integerValue] ,(long)totalNum);
                    
                    NSInteger val = [percentArr[i]integerValue] + 1;
                    percentArr[i] = [NSString stringWithFormat:@"%zd", val];
                }
            }
            
            for (NSString *num in percentArr) {
                NSString *finalNum = [NSString stringWithFormat:@"%zd", [num integerValue]];
                [finalArr addObject:finalNum];
                
            }
        }
    }
    
    
    NSLog(@"arrar : %@", finalArr);
}
@end
