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

/*
 * @params
 * deviceType : NSString
 * version : NSInteter
 * lang : NSString
 * authCode : NSString
 */
#define CELEB_AUTHORIZE_API                                 @"http://pointapibeta.smtown.com/api/v1/introAuthCode"


@interface celebAuth : NSObject

@property (assign, nonatomic) int code;
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSString *data;
@property (assign, nonatomic) BOOL result;


@end

@implementation celebAuth



@end

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

@property (strong, nonatomic) NSDictionary *jsonDic;

@property (strong, nonatomic) celebAuth *ca;



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
    
    NSLog(@"%@", [self getColorWithRGBCode:@"ffb5bf"]);
    

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
    
    [self startUrlSession];
    

}


#pragma mark - Multi-Device

-(void)setRatioOfDevicewithDevieWidth:(int)width
{
    
    
    self.alcIvLogoWidth.constant = WRATIO_WIDTH(664.0f);
    self.alcIvLogoHeight.constant = WRATIO_WIDTH(190.0f);
    self.alcTfInputWidth.constant = WRATIO_WIDTH(855.0f);
    self.alcTfInputHeight.constant = WRATIO_WIDTH(120.0f);
    self.alcBtnOkWidth.constant = WRATIO_WIDTH(850);
    self.alcBtnOkheight.constant = WRATIO_WIDTH(120);
    self.alcIvBottmWidth.constant = WRATIO_WIDTH(1009);
    self.alcIvBottomHeight.constant = WRATIO_WIDTH(86);
    
    self.alcLbDetailWidth.constant = [self getWidthOfTargetWithTargetValue:185.0f andDevieWidth:width];
    self.alcLbDetailHeight.constant = [self getWidthOfTargetWithTargetValue:34.0f andDevieWidth:width];
    self.alcLbInputCommentWidth.constant = [self getWidthOfTargetWithTargetValue:198.0f andDevieWidth:width];
    self.alcLbInputCommentHeight.constant = [self getWidthOfTargetWithTargetValue:20.0f andDevieWidth:width];
    self.alcLbPrivateServiceWidth.constant = [self getWidthOfTargetWithTargetValue:140.0f andDevieWidth:width];
    self.alcLbPrivateServiceHeight.constant = [self getWidthOfTargetWithTargetValue:17.0f andDevieWidth:width];
    
    self.alcBottomMarginOfIvBottom.constant = WRATIO_WIDTH(112.0f);
    self.alcBottomMarginFromLbDetailToIvBottom.constant = WRATIO_WIDTH(366);
    self.alcBottomMarginFromLbPrivateToLbDetail.constant = WRATIO_WIDTH(40.0f);
    self.alcBottomMarginFrombtnOkToLbPrivate.constant = WRATIO_WIDTH(130.0f);
    self.alcBottomMarginFromTfTobtnOk.constant = WRATIO_WIDTH(16.0f);
    self.alcBottomMarginFromLbInputToTf.constant = WRATIO_WIDTH(55.0f);
    self.alcBottomMarginFromIvLogoToLbInput.constant = WRATIO_WIDTH(317.0f);
    
    
    self.lbInputComment.font = [UIFont systemFontOfSize: [self getWidthOfTargetWithTargetValue:16 andDevieWidth:width]];
    self.lbPrivateService.font = [UIFont boldSystemFontOfSize: [self getWidthOfTargetWithTargetValue:14 andDevieWidth:width]];
    self.lbDetail.font = [UIFont systemFontOfSize:[self getWidthOfTargetWithTargetValue:14 andDevieWidth:width]];
    self.btnOk.titleLabel.font = [UIFont boldSystemFontOfSize:[self getWidthOfTargetWithTargetValue:15 andDevieWidth:width]];
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;

    if(screenHeight == 480)
    {
        self.alcBottomMarginFromLbDetailToIvBottom.constant = [self getHeightOfTargetWithTargetValue:366.0f andDeviceHeight:screenHeight];
        self.alcBottomMarginFromLbPrivateToLbDetail.constant = [self getHeightOfTargetWithTargetValue:40.0f andDeviceHeight:screenHeight];
        self.alcBottomMarginFrombtnOkToLbPrivate.constant = [self getHeightOfTargetWithTargetValue:130.0f andDeviceHeight:screenHeight];
        self.alcBottomMarginFromTfTobtnOk.constant = [self getHeightOfTargetWithTargetValue:16.0f andDeviceHeight:screenHeight];
        self.alcBottomMarginFromLbInputToTf.constant = [self getHeightOfTargetWithTargetValue:55.0f andDeviceHeight:screenHeight];
        self.alcBottomMarginFromIvLogoToLbInput.constant = [self getHeightOfTargetWithTargetValue:317.0f andDeviceHeight:screenHeight];
        self.alcBottomMarginOfIvBottom.constant = [self getHeightOfTargetWithTargetValue:112.0f  andDeviceHeight:screenHeight];


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
    
    result = height/736*dvHeight/3;
    
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

#pragma mark - Request

-(void)startUrlSession
{
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:CELEB_AUTHORIZE_API];
 
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPMethod:@"POST"];
    
    NSDictionary *HTTPBodyDic = @{@"deviceType":@"ios",
                                  @"version" : @2,
                                  @"lang" : @"ko",
                                  @"authCode": self.tfInput.text };
    NSError *error;
    
    [urlRequest setHTTPBody:[NSJSONSerialization dataWithJSONObject:HTTPBodyDic options:0 error:&error]];
    
    [[session dataTaskWithRequest:urlRequest
                        completionHandler:^(NSData *data, NSURLResponse *response,
                                            NSError *error) {
                            
                            id sentData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                            
                            if ([sentData isKindOfClass:[NSArray class]])
                            {
                                NSLog(@"잘못된 정보임.");
                            }
                            if([sentData isKindOfClass:[NSDictionary class]])
                            {
                                NSDictionary *resultDic;
                                resultDic = sentData;
                                NSLog(@"dic: %@", resultDic);
                                [self processOfRequestWithParam:resultDic];
                                
                            }
                                                                                               }] resume];
    
}

-(void)processOfRequestWithParam:(id)param
{
    self.ca = [[celebAuth alloc]init];
    self.ca.code = [[param objectForKey:@"code"] intValue];
    self.ca.message = [param objectForKey:@"message"];
    self.ca.result = [[param objectForKey:@"result"] boolValue];
    
    if (self.ca.result) {
        NSLog(@"인증됨!");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *sgId = @"sgUIViewtoLogInView";
            [self performSegueWithIdentifier:sgId sender:self];        });
        
        
    }
    else{
        NSLog(@"꼬져!");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"wrong authorization code" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            
            [alert addAction:defaultAction];
            
            [self presentViewController:alert animated:YES completion:nil];
        });
    }
    
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
    {
        [self.tfInput resignFirstResponder];
        
    }

}






@end
