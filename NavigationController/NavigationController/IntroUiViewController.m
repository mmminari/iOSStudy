//
//  IntroUiViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 22..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "IntroUiViewController.h"


#define DEVICE_WIDTH                                        [UIScreen mainScreen].bounds.size.width
#define STANDARD_DEVICE_WIDTH                               414.0f
#define WRATIO_WIDTH(w)                                     (w/3.0f) / STANDARD_DEVICE_WIDTH * DEVICE_WIDTH


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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLbPrivateServiceHeight;

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
    
    self.mainContainerView.backgroundColor = [self getColorWithRGBCode:@"ffb5bf"];
    self.btnOk.backgroundColor = [self getColorWithRGBCode:@"4b4b4b"];
    self.lbInputComment.textColor = [self getColorWithRGBCode:@"4b4b4b"];
    self.lbPrivateService.textColor = [self getColorWithRGBCode:@"4b4b4b"];
    self.lbDetail.textColor = [self getColorWithRGBCode:@"4b4b4b"];
    self.tfInput.backgroundColor = [self getColorWithRGBCode:@"ffffff"];

    self.ivBottomImage.image = [UIImage imageNamed:@"SM_logos"];
    self.ivLogoImage.image = [UIImage imageNamed:@"smtownmembership_logo"];

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
    
//    self.alcLbDetailWidth.constant = [self getWidthOfTargetWithTargetValue:self.alcLbDetailWidth.constant andDevieWidth:width];
    self.alcLbDetailWidth.constant = WRATIO_WIDTH(540.0f);
    self.alcLbDetailHeight.constant = [self getWidthOfTargetWithTargetValue:self.alcLbDetailHeight.constant andDevieWidth:width];
    self.alcIvLogoWidth.constant = [self getWidthOfTargetWithTargetValue:self.alcIvLogoWidth.constant andDevieWidth:width];
    self.alcIvLogoHeight.constant = [self getWidthOfTargetWithTargetValue:self.alcIvLogoHeight.constant andDevieWidth:width];
    self.alcTfInputWidth.constant = [self getWidthOfTargetWithTargetValue:self.alcTfInputWidth.constant andDevieWidth:width];
    self.alcTfInputHeight.constant = [self getWidthOfTargetWithTargetValue:self.alcTfInputHeight.constant andDevieWidth:width];
    self.alcBtnOkWidth.constant = [self getWidthOfTargetWithTargetValue:self.alcBtnOkWidth.constant andDevieWidth:width];
    self.alcBtnOkheight.constant = [self getWidthOfTargetWithTargetValue:self.alcBtnOkheight.constant andDevieWidth:width];
    self.alcIvBottmWidth.constant = [self getWidthOfTargetWithTargetValue:self.alcIvBottmWidth.constant andDevieWidth:width];
    self.alcIvBottomHeight.constant = [self getWidthOfTargetWithTargetValue:self.alcIvBottomHeight.constant andDevieWidth:width];
    self.alcLbInputCommentWidth.constant = [self getWidthOfTargetWithTargetValue:self.alcLbInputCommentWidth.constant andDevieWidth:width];
    self.alcLbInputCommentHeight.constant = [self getWidthOfTargetWithTargetValue:self.alcLbInputCommentHeight.constant andDevieWidth:width];
    self.alcLbPrivateServiceWidth.constant = [self getWidthOfTargetWithTargetValue:self.alcLbPrivateServiceWidth.constant andDevieWidth:width];
    self.alcLbPrivateServiceHeight.constant = [self getWidthOfTargetWithTargetValue:self.alcLbPrivateServiceHeight.constant andDevieWidth:width];
    
    self.alcBottomMarginOfIvBottom.constant = [self getWidthOfTargetWithTargetValue:self.alcBottomMarginOfIvBottom.constant andDevieWidth:width];
    self.alcBottomMarginFromLbDetailToIvBottom.constant = [self getWidthOfTargetWithTargetValue:self.alcBottomMarginFromLbDetailToIvBottom.constant  andDevieWidth:width];
    self.alcBottomMarginFromLbPrivateToLbDetail.constant = [self getWidthOfTargetWithTargetValue:self.alcBottomMarginFromLbPrivateToLbDetail.constant andDevieWidth:width];
    self.alcBottomMarginFrombtnOkToLbPrivate.constant = [self getWidthOfTargetWithTargetValue:self.alcBottomMarginFrombtnOkToLbPrivate.constant andDevieWidth:width];
    self.alcBottomMarginFromTfTobtnOk.constant = [self getWidthOfTargetWithTargetValue:self.alcBottomMarginFromTfTobtnOk.constant andDevieWidth:width];
    self.alcBottomMarginFromLbInputToTf.constant = [self getWidthOfTargetWithTargetValue:self.alcBottomMarginFromLbInputToTf.constant andDevieWidth:width];
    self.alcBottomMarginFromIvLogoToLbInput.constant = [self getWidthOfTargetWithTargetValue:self.alcBottomMarginFromIvLogoToLbInput.constant andDevieWidth:width];
    
    
    self.lbInputComment.font = [UIFont systemFontOfSize: [self getWidthOfTargetWithTargetValue:16 andDevieWidth:width]];
    self.lbPrivateService.font = [UIFont boldSystemFontOfSize: [self getWidthOfTargetWithTargetValue:14 andDevieWidth:width]];
    self.lbDetail.font = [UIFont systemFontOfSize:[self getWidthOfTargetWithTargetValue:14 andDevieWidth:width]];
    self.btnOk.titleLabel.font = [UIFont boldSystemFontOfSize:[self getWidthOfTargetWithTargetValue:15 andDevieWidth:width]];
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;

    if(screenHeight == 480)
    {
        self.alcBottomMarginFromLbDetailToIvBottom.constant = [self getHeightOfTargetWithTargetValue:self.alcBottomMarginFromLbDetailToIvBottom.constant andDeviceHeight:screenHeight];
        self.alcBottomMarginFromLbPrivateToLbDetail.constant = [self getHeightOfTargetWithTargetValue:self.alcBottomMarginFromLbPrivateToLbDetail.constant andDeviceHeight:screenHeight];
        self.alcBottomMarginFrombtnOkToLbPrivate.constant = [self getHeightOfTargetWithTargetValue:self.alcBottomMarginFrombtnOkToLbPrivate.constant andDeviceHeight:screenHeight];
        self.alcBottomMarginFromTfTobtnOk.constant = [self getHeightOfTargetWithTargetValue:self.alcBottomMarginFromTfTobtnOk.constant andDeviceHeight:screenHeight];
        self.alcBottomMarginFromLbInputToTf.constant = [self getHeightOfTargetWithTargetValue:self.alcBottomMarginFromLbInputToTf.constant andDeviceHeight:screenHeight];
        self.alcBottomMarginFromIvLogoToLbInput.constant = [self getHeightOfTargetWithTargetValue:self.alcBottomMarginFromIvLogoToLbInput.constant andDeviceHeight:screenHeight];
        self.alcBottomMarginOfIvBottom.constant = [self getHeightOfTargetWithTargetValue:self.alcBottomMarginOfIvBottom.constant  andDeviceHeight:screenHeight];


    }

}

-(CGFloat)getWidthOfTargetWithTargetValue:(CGFloat)width andDevieWidth:(CGFloat)dvWidth
{
    CGFloat result;
    
    result = width/414*dvWidth;
    
    return result;
    
    
}

-(CGFloat)getHeightOfTargetWithTargetValue:(CGFloat)height andDeviceHeight:(CGFloat)dvHeight
{
    CGFloat result;
    
    result = height/736*dvHeight;
    
    return result;
    
}



#pragma mark - Set UIColor
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
        NSString *color, *color1, *color2 = nil;
        
        
        
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
            
//            if(i == 0)
//                color1 = color;
//            else
//                color2 = color;
            if (i == 0) {
                totalValue += color.integerValue * 16;
            }else
            {
                totalValue += color.integerValue;
            }
            
            
        }
        
//        CGFloat colorValue1 = color1.floatValue;
//        CGFloat colorValue2 = color2.floatValue;

//        colorValue1 = (colorValue2+colorValue1*16)/255;
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
