//
//  IntroUiViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 22..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "IntroUiViewController.h"

@interface IntroUiViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivLogoImage;
@property (weak, nonatomic) IBOutlet UIButton *btnOk;
@property (weak, nonatomic) IBOutlet UITextField *tfInput;
@property (weak, nonatomic) IBOutlet UIButton *btnHide;

@property (weak, nonatomic) IBOutlet UILabel *lbInputComment;
@property (weak, nonatomic) IBOutlet UILabel *lbPrivateService;
@property (weak, nonatomic) IBOutlet UILabel *lbDetail;
@property (weak, nonatomic) IBOutlet UIView *mainContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *ivBottomImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLbDetailHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLbDetailWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcIvBottomHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcIvBottmWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcIvLogoHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcIvLogoWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTfInputHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTfInputWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBtnOkWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBtnOkheight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLbInputCommentWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLbInputCommentHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLbPrivateServiceWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *AlcLbPrivateServiceHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomMarginOfIvBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomMarginFromLbDetailToIvBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomMarginFromLbPrivateToLbDetail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomMarginFrombtnOkToLbPrivate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomMarginFromTfTobtnOk;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomMarginFromIvLogoToLbInput;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomMarginFromLbInputToTf;




@end

@implementation IntroUiViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.btnHide setHidden:YES];
    
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    [self setRatioOfDevicewithDevieWidth:screenWidth];
    
    self.mainContainerView.backgroundColor = [self setColorWithRGBCode:@"ffb5bf"];
    self.btnOk.backgroundColor = [self setColorWithRGBCode:@"4b4b4b"];
    self.lbInputComment.textColor = [self setColorWithRGBCode:@"4b4b4b"];
    self.lbPrivateService.textColor = [self setColorWithRGBCode:@"4b4b4b"];
    self.lbDetail.textColor = [self setColorWithRGBCode:@"4b4b4b"];
    self.tfInput.backgroundColor = [self setColorWithRGBCode:@"ffffff"];

    self.ivBottomImage.image = [UIImage imageNamed:@"SM_logos"];
    self.ivLogoImage.image = [UIImage imageNamed:@"smtownmembership_logo@3x"];

}


#pragma mark - Touched Event


- (IBAction)touchedBtnOk:(id)sender
{
    
    if([self.tfInput.text isEqualToString:@""])
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Plz input the authorization code" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}


#pragma mark - Multi-Device

-(void)setRatioOfDevicewithDevieWidth:(int)width
{
    
    [self setWidthOfTargetWithTargetValue:self.alcLbDetailWidth.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcLbDetailHeight.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcIvLogoWidth.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcIvLogoHeight.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcTfInputWidth.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcTfInputHeight.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcBtnOkWidth.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcBtnOkheight.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcIvBottmWidth.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcIvBottomHeight.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcLbInputCommentWidth.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcLbInputCommentHeight.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcLbPrivateServiceWidth.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.AlcLbPrivateServiceHeight.constant andDevieWidth:width];
    
    [self setWidthOfTargetWithTargetValue:self.alcBottomMarginOfIvBottom.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcBottomMarginFromLbDetailToIvBottom.constant  andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcBottomMarginFromLbPrivateToLbDetail.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcBottomMarginFrombtnOkToLbPrivate.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcBottomMarginFromTfTobtnOk.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcBottomMarginFromLbInputToTf.constant andDevieWidth:width];
    [self setWidthOfTargetWithTargetValue:self.alcBottomMarginFromIvLogoToLbInput.constant andDevieWidth:width];
    
    
    self.lbInputComment.font = [UIFont systemFontOfSize: [self setWidthOfTargetWithTargetValue:16 andDevieWidth:width]];
    self.lbPrivateService.font = [UIFont boldSystemFontOfSize: [self setWidthOfTargetWithTargetValue:14 andDevieWidth:width]];
    self.lbDetail.font = [UIFont systemFontOfSize:[self setWidthOfTargetWithTargetValue:14 andDevieWidth:width]];
    self.btnOk.titleLabel.font = [UIFont boldSystemFontOfSize:[self setWidthOfTargetWithTargetValue:15 andDevieWidth:width]];
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;

    if(screenHeight == 480)
    {
        [self setHeightOfTargetWithTargetValue:self.alcBottomMarginFromLbDetailToIvBottom.constant andDeviceHeight:screenHeight];
        [self setHeightOfTargetWithTargetValue:self.alcBottomMarginFromLbPrivateToLbDetail.constant andDeviceHeight:screenHeight];
        [self setHeightOfTargetWithTargetValue:self.alcBottomMarginFrombtnOkToLbPrivate.constant andDeviceHeight:screenHeight];
        [self setHeightOfTargetWithTargetValue:self.alcBottomMarginFromTfTobtnOk.constant andDeviceHeight:screenHeight];
        [self setHeightOfTargetWithTargetValue:self.alcBottomMarginFromLbInputToTf.constant andDeviceHeight:screenHeight];
        [self setHeightOfTargetWithTargetValue:self.alcBottomMarginFromIvLogoToLbInput.constant andDeviceHeight:screenHeight];
        [self setHeightOfTargetWithTargetValue:self.alcBottomMarginOfIvBottom.constant  andDeviceHeight:screenHeight];


    }

}

-(CGFloat)setWidthOfTargetWithTargetValue:(CGFloat)width andDevieWidth:(CGFloat)dvWidth
{
    CGFloat result;
    
    result = width/414*dvWidth;
    
    return result;
    
    
}

-(CGFloat)setHeightOfTargetWithTargetValue:(CGFloat)height andDeviceHeight:(CGFloat)dvHeight
{
    CGFloat result;
    
    result = height/736*dvHeight;
    
    return result;
    
}



#pragma mark - Set UIColor
-(UIColor *)setColorWithRGBCode:(NSString *)code
{
    UIColor *color = nil;
    
    NSMutableDictionary *rgbDictionary = [[NSMutableDictionary alloc]init];
    [rgbDictionary setObject:[code substringWithRange:NSMakeRange(0, 2)] forKey:@"Red"];
    [rgbDictionary setObject:[code substringWithRange:NSMakeRange(2, 2)] forKey:@"Green"];
    [rgbDictionary setObject:[code substringWithRange:NSMakeRange(4, 2)] forKey:@"Blue"];
    
    for (NSString *colorKey in rgbDictionary.allKeys) {
        NSString *colorValue = [rgbDictionary objectForKey:colorKey];
        NSString *color1 = [colorValue substringWithRange:NSMakeRange(0, 1)];
        NSString *color2 = [colorValue substringWithRange:NSMakeRange(1, 1)];
  
        if([color1 isEqualToString:@"a"])
            color1 = @"10";
        else if([color1 isEqualToString:@"b"])
            color1 = @"11";
        else if([color1 isEqualToString:@"c"])
            color1 = @"12";
        else if([color1 isEqualToString:@"d"])
            color1 = @"13";
        else if([color1 isEqualToString:@"e"])
            color1 = @"14";
        else if([color1 isEqualToString:@"f"])
            color1 = @"15";
        
        if([color2 isEqualToString:@"a"])
            color2 = @"10";
        else if([color2 isEqualToString:@"b"])
            color2 = @"11";
        else if([color2 isEqualToString:@"c"])
            color2 = @"12";
        else if([color2 isEqualToString:@"d"])
            color2 = @"13";
        else if([color2 isEqualToString:@"e"])
            color2 = @"14";
        else if([color2 isEqualToString:@"f"])
            color2 = @"15";
        
        CGFloat colorValue1 = color1.floatValue;
        CGFloat colorValue2 = color2.floatValue;

        colorValue1 = (colorValue2+colorValue1*16)/255;
        
        [rgbDictionary setObject:[NSString stringWithFormat:@"%f",colorValue1] forKey:colorKey];

    }
    
    color = [UIColor colorWithRed:[[rgbDictionary valueForKey:@"Red"] floatValue] green:[[rgbDictionary valueForKey:@"Green"] floatValue] blue:[[rgbDictionary valueForKey:@"Blue"] floatValue] alpha:1];
    
    return color;
  
}


#pragma mark - Hide TextField Keyboard

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self.btnHide setHidden:NO];
    
    return YES  ;
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [self.btnHide setHidden:YES];
    
    return YES;
}



- (IBAction)touchedHideKeyBoard:(id)sender withTextField:(UITextField *)textField
{
    if([self.tfInput isFirstResponder])
        [self.tfInput resignFirstResponder];

}


@end
