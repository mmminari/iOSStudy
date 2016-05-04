//
//  IntroUiViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 22..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UtilityClass.h"

@interface IntroUiViewController : UtilityClass


-(CGFloat)getWidthOfTargetWithTargetValue:(CGFloat)width andDevieWidth:(CGFloat)dvWidth;
-(CGFloat)getHeightOfTargetWithTargetValue:(CGFloat)height andDeviceHeight:(CGFloat)dvHeight;
-(UIColor *)getColorWithRGBCode:(NSString *)code;



@end
