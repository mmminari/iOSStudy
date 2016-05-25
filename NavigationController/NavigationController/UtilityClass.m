//
//  UtilityClass.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 4..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "UtilityClass.h"


@interface UtilityClass ()

@end

@implementation UtilityClass

-(CGFloat)getScreenWidth
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    return screenWidth;
    
}

-(UIColor *)getColorWithRGBCode:(NSString *)code
{
    UIColor *color = nil;
    
    NSMutableDictionary *rgbDictionary = [[NSMutableDictionary alloc]init];
    [rgbDictionary setObject:[code substringWithRange:NSMakeRange(0, 2)] forKey:@"Red"];
    [rgbDictionary setObject:[code substringWithRange:NSMakeRange(2, 2)] forKey:@"Green"];
    [rgbDictionary setObject:[code substringWithRange:NSMakeRange(4, 2)] forKey:@"Blue"];
    
    NSInteger totalValue = 0;
    CGFloat finalColorValue = 0;
    
    for (NSString *colorKey in rgbDictionary.allKeys)
    {
        NSString *colorValue = [rgbDictionary objectForKey:colorKey];
        NSString *color = nil;
        
        for(int i = 0; i<[colorValue length];i++)
        {
            
            color = [colorValue substringWithRange:NSMakeRange(i, 1)];
            
            if([color isEqualToString:@"a"])
                color = @"10";
            else if([color isEqualToString:@"b"])
                color = @"11";
            else if([color isEqualToString:@"c"])
                color = @"12";
            else if([color isEqualToString:@"d"])
                color = @"13";
            else if([color isEqualToString:@"e"])
                color = @"14";
            else if([color isEqualToString:@"f"])
                color = @"15";
            
            if (i == 0) {
                totalValue += color.integerValue * 16;
            }else
            {
                totalValue += color.integerValue;
            }
        }
        
        finalColorValue = totalValue / 255.0f;
        
        [rgbDictionary setObject:[NSNumber numberWithFloat:finalColorValue] forKey:colorKey];
        
        finalColorValue = 0.0f;
        totalValue = 0.0f;
        
    }
    
    color = [UIColor colorWithRed:[[rgbDictionary valueForKey:@"Red"] floatValue]
                            green:[[rgbDictionary valueForKey:@"Green"] floatValue]
                             blue:[[rgbDictionary valueForKey:@"Blue"] floatValue] alpha:1];
    
    return color;
    
}

-(id)getValueWithKey:(NSString *)key Dictionary:(NSDictionary *)dic
{
    id result = nil;
    
    id value = [dic objectForKey:key];
    if([value isKindOfClass:[NSNull class]])
    {
        result = nil;
    }
    else
    {
        result = value;
    }
    
    return result;
    
}

-(void)setContentViewLayoutWithSubView:(UIView *)subView withTargetView:(UIView *)targetView
{
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *alcTopOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                       attribute:NSLayoutAttributeTop
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:targetView attribute:NSLayoutAttributeTop
                                                                      multiplier:1.0f
                                                                        constant:0.0f];
    
    NSLayoutConstraint *alcBottomOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                          attribute:NSLayoutAttributeBottom
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:targetView attribute:NSLayoutAttributeBottom
                                                                         multiplier:1.0f
                                                                           constant:0.0f];
    
    NSLayoutConstraint *alcLeadingOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                           attribute:NSLayoutAttributeLeading
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:targetView attribute:NSLayoutAttributeLeading
                                                                          multiplier:1.0f
                                                                            constant:0.0f];
    
    NSLayoutConstraint *alcTrailingOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                            attribute:NSLayoutAttributeTrailing
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:targetView attribute:NSLayoutAttributeTrailing
                                                                           multiplier:1.0f
                                                                             constant:0.0f];
    
    NSArray *cArr = @[alcTopOfSubView, alcBottomOfSubView, alcLeadingOfSubView, alcTrailingOfSubView];
    
    [targetView addConstraints:cArr];
    
}


@end
