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

    NSLog(@"%d", screenWidth);
    
    [self setRatioOfDevicewithDevieWidth:screenWidth];
    
    

    self.mainContainerView.backgroundColor = [self setColorWithRGBCode:@"#ffb5bf"];
    
    self.btnOk.backgroundColor = [self setColorWithRGBCode:@"#4b4b4b"];
    self.lbInputComment.textColor = [self setColorWithRGBCode:@"#4b4b4b"];
    self.lbPrivateService.textColor = [self setColorWithRGBCode:@"#4b4b4b"];
    self.lbDetail.textColor = [self setColorWithRGBCode:@"#4b4b4b"];
    self.tfInput.backgroundColor = [self setColorWithRGBCode:@"#ffffff"];

    self.ivBottomImage.image = [UIImage imageNamed:@"SM_logos.png"];
    self.ivLogoImage.image = [UIImage imageNamed:@"smtownmembership_logo@3x.png"];

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
    
    self.alcLbDetailWidth.constant = (self.alcLbDetailWidth.constant)/414*width;
    self.alcLbDetailHeight.constant= self.alcLbDetailHeight.constant/414*width;
    self.alcIvLogoWidth.constant = self.alcIvLogoWidth.constant/414*width;
    self.alcIvLogoHeight.constant = self.alcIvLogoHeight.constant/414*width;
    self.alcTfInputWidth.constant = self.alcTfInputWidth.constant/414*width;
    self.alcTfInputHeight.constant = self.alcTfInputHeight.constant/414*width;
    self.alcBtnOkWidth.constant = self.alcBtnOkWidth.constant/414*width;
    self.alcBtnOkheight.constant = self.alcBtnOkheight.constant/414*width;
    self.alcIvBottmWidth.constant = self.alcIvBottmWidth.constant/414*width;
    self.alcIvBottomHeight.constant = self.alcIvBottomHeight.constant/414*width;
    self.alcLbInputCommentWidth.constant = self.alcLbInputCommentWidth.constant/414*width;
    self.alcLbInputCommentHeight.constant = self.alcLbInputCommentHeight.constant/414*width;
    self.alcLbPrivateServiceWidth.constant = self.alcLbPrivateServiceWidth.constant/414*width;
    self.AlcLbPrivateServiceHeight.constant = self.AlcLbPrivateServiceHeight.constant/414*width;
    self.alcBottomMarginOfIvBottom.constant = self.alcBottomMarginOfIvBottom.constant/414*width;
    
    self.alcBottomMarginFromLbDetailToIvBottom.constant = self.alcBottomMarginFromLbDetailToIvBottom.constant/414*width;
    self.alcBottomMarginFromLbPrivateToLbDetail.constant = self.alcBottomMarginFromLbPrivateToLbDetail.constant/414*width;
    self.alcBottomMarginFrombtnOkToLbPrivate.constant = self.alcBottomMarginFrombtnOkToLbPrivate.constant/414*width;
    self.alcBottomMarginFromTfTobtnOk.constant = self.alcBottomMarginFromTfTobtnOk.constant/414*width;
    self.alcBottomMarginFromLbInputToTf.constant = self.alcBottomMarginFromLbInputToTf.constant/414*width;
    self.alcBottomMarginFromIvLogoToLbInput.constant = self.alcBottomMarginFromIvLogoToLbInput.constant/414*width;
    self.alcBottomMarginOfIvBottom.constant = self.alcBottomMarginOfIvBottom.constant/414*width;
    
    self.lbInputComment.font = [UIFont systemFontOfSize:(float)16/414*width];
    self.lbPrivateService.font = [UIFont boldSystemFontOfSize:(float)14/414*width];
    self.lbDetail.font = [UIFont systemFontOfSize:(float)14/414*width];
    self.btnOk.titleLabel.font = [UIFont boldSystemFontOfSize:(float)15/414*width];
    
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;

    if(screenHeight == 480)
    {
        self.alcBottomMarginFromLbDetailToIvBottom.constant = self.alcBottomMarginFromLbDetailToIvBottom.constant/736*screenHeight;
        self.alcBottomMarginFromLbPrivateToLbDetail.constant = self.alcBottomMarginFromLbPrivateToLbDetail.constant/736*screenHeight;
        self.alcBottomMarginFrombtnOkToLbPrivate.constant = self.alcBottomMarginFrombtnOkToLbPrivate.constant/736*screenHeight;
        self.alcBottomMarginFromTfTobtnOk.constant = self.alcBottomMarginFromTfTobtnOk.constant/736*screenHeight;
        self.alcBottomMarginFromLbInputToTf.constant = self.alcBottomMarginFromLbInputToTf.constant/736*screenHeight;
        self.alcBottomMarginFromIvLogoToLbInput.constant = self.alcBottomMarginFromIvLogoToLbInput.constant/736*screenHeight;
        self.alcBottomMarginOfIvBottom.constant = self.alcBottomMarginOfIvBottom.constant/736*screenHeight;

    }

}



#pragma mark - Set UIColor
-(UIColor *)setColorWithRGBCode:(NSString *)code
{
    UIColor *color = nil;
    
    
    NSMutableArray *numberMutableArr = [[NSMutableArray alloc]init];
    
    for(int i= 1; i < 7; i++){
        [numberMutableArr addObject:[code substringWithRange:NSMakeRange(i, 1)]];
    }

    for (int i = 0; i < numberMutableArr.count; i++){
        if([numberMutableArr[i] isEqualToString:@"a"])
            numberMutableArr[i] = @"10";
        else if([numberMutableArr[i] isEqualToString:@"b"])
            numberMutableArr[i] = @"11";
        else if([numberMutableArr[i] isEqualToString:@"c"])
            numberMutableArr[i] = @"12";
        else if([numberMutableArr[i] isEqualToString:@"d"])
            numberMutableArr[i] = @"13";
        else if([numberMutableArr[i] isEqualToString:@"e"])
            numberMutableArr[i] = @"14";
        else if([numberMutableArr[i] isEqualToString:@"f"])
            numberMutableArr[i] = @"15";
        
    }
    
    for(int i = 0; i<numberMutableArr.count-1; i=i+2){
        float a = [numberMutableArr[i] floatValue];
        float b = [numberMutableArr[i+1] floatValue];

        a = (a*16+b)/255;
        numberMutableArr[i] = [NSString stringWithFormat:@"%f", a];
    }
    
    float red = [numberMutableArr[0] floatValue];
    float green = [numberMutableArr[2] floatValue];
    float blue = [numberMutableArr[4] floatValue];

    color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
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
