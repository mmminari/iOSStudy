//
//  HomeViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "HomeViewController.h"
#import "UserInformation.h"
#import "BarcodeViewController.h"

@interface HomeViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *ivUser;

@property (weak, nonatomic) IBOutlet UILabel *lbAvailablePoint;
@property (weak, nonatomic) IBOutlet UILabel *lbShowPoint;
@property (weak, nonatomic) IBOutlet UILabel *lbPoint;
@property (weak, nonatomic) IBOutlet UIImageView *ivCard;
@property (weak, nonatomic) IBOutlet UILabel *lbBarCord;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopLogo;
@property (weak, nonatomic) IBOutlet UIImageView *ivTopRight;
@property (weak, nonatomic) IBOutlet UIImageView *ivNavigationBottomColor;
@property (weak, nonatomic) IBOutlet UIImageView *ivEnlargeBar;
@property (weak, nonatomic) IBOutlet UIImageView *ivBarcodeBackground;
@property (weak, nonatomic) IBOutlet UIImageView *ivBarcode;
@property (weak, nonatomic) IBOutlet UILabel *lbBarcode;

@property (weak, nonatomic) IBOutlet UIImageView *ivMenuBottomColor;

@property (weak, nonatomic) IBOutlet UIButton *btnHome;
@property (weak, nonatomic) IBOutlet UIButton *btnPoint;
@property (weak, nonatomic) IBOutlet UIButton *btnCard;
@property (weak, nonatomic) IBOutlet UIButton *btnStore;

@property (weak, nonatomic) IBOutlet UIView *navigationContainerView;
@property (weak, nonatomic) IBOutlet UIView *menuContainerView;
@property (weak, nonatomic) IBOutlet UIView *userInfoContainerView;
@property (weak, nonatomic) IBOutlet UIView *pointContainerView;
@property (weak, nonatomic) IBOutlet UIView *labelContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *ivCenterLine;
@property (weak, nonatomic) IBOutlet UIImageView *ivMenuBottomPinkColor;
@property (weak, nonatomic) IBOutlet UIImageView *ivMiddleBell;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfNaviagtionBar;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfIndicator;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfHomeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfCardView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfStoreView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfIndicator;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfNoticeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfNoticeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfNoticeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfNoticeView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfUserInfoView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfUserView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfUserView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfUserView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfUsername;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMiddleLine;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfPointView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfPointViewContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfAvailablePoint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfCard;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfCard;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfCard;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCard;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfMiddleBell;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMiddleBell;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfUserImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfUserImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfTopImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTopImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMenuImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfMenuImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfMenuBar;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfShowPoint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfTopImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfTopMenuImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfHomeMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfPointMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCardMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfStoreMenu;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfVIP;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfVIP;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfUserName;
@property (weak, nonatomic) IBOutlet UIImageView *ivVIP;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcCenterOfUserName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfBanner;

@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet UIImageView *ivBanner;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfBannerView;
@property (strong, nonatomic) NSString *bannerUrlString;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfBarcodeBackground;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfBarcodeBackground;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfBarcodeBack;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfBarcodeBack;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfLbCenter;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfBarcodeBack;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfBarcodeContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfBarcodeContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfBarcodeBackgroundView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidhOfBarcodeContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfBarcodeIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfBarcodeIcon;

@end

@implementation HomeViewController

typedef NS_ENUM(NSInteger, ButtonTagNumber){
    ButtonTagNumberHome = 1000,
    ButtonTagNumberPoint,
    ButtonTagNumberCard,
    ButtonTagNumberStore,
};

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lbMiddleNotice.text = [self.library.mainInfo eventTitle];
    self.lbUserEmail.text = [self.library.userInfo userId];
    self.lbUserName.text = [self.library.userInfo userName];

    self.lbAvailablePoint.text = [NSString stringWithFormat:@"%ld", (long)[self.library.userInfo point]];

    self.btnHome.tag = ButtonTagNumberHome;
    self.btnPoint.tag = ButtonTagNumberPoint;
    self.btnCard.tag = ButtonTagNumberCard;
    self.btnStore.tag = ButtonTagNumberStore;

    [self.navigationController setNavigationBarHidden:YES];
    
    self.ivUser.image = [UIImage imageNamed:@"img_main_profile"];
    self.ivCard.image = [UIImage imageNamed:@"img_card_main"];
    self.ivCard.layer.cornerRadius = HRATIO_HEIGHT(130.0f)/2;
    self.ivCard.layer.masksToBounds = YES;
    
    self.ivTopLogo.image = [UIImage imageNamed:@"top_logo"];
    self.ivTopRight.image = [UIImage imageNamed:@"btn_menu"];

    self.ivMiddleBell.image = [UIImage imageNamed:@"icon_notice_bell"];
    self.ivVIP.image = [UIImage imageNamed:@"icon_grade_vip"];

    self.labelContainerView.layer.cornerRadius = WRATIO_WIDTH(69);
    
    self.ivUser.layer.cornerRadius = WRATIO_WIDTH(195)/2;
    self.ivUser.layer.masksToBounds = YES;
    
    self.ivUser.image = [UIImage imageNamed:@"img_profile_menu"];
    self.ivEnlargeBar.image = [UIImage imageNamed:@"btn_card_largeimg_sub"];
    self.ivBarcodeBackground.backgroundColor = [UIColor whiteColor];
    self.ivBarcodeBackground.layer.cornerRadius = HRATIO_HEIGHT(95.0f)/2;

    self.alcLeadingOfLbCenter.constant = WRATIO_WIDTH(110.0f);
    self.alcTopOfBarcodeBack.constant = HRATIO_HEIGHT(120.0f);
    self.alcLeadingOfBarcodeBack.constant = HRATIO_HEIGHT(75.0f);
    self.alcTrailingOfBarcodeBack.constant = HRATIO_HEIGHT(-135.0f);
    
    self.lbBarcode.font = [UIFont systemFontOfSize:HRATIO_HEIGHT(45.0f)];
    
    self.alcTopOfBarcodeContainerView.constant = WRATIO_WIDTH(63.0f);
    self.alcTrailingOfBarcodeBackgroundView.constant = WRATIO_WIDTH(-63.0f);
    self.alcWidhOfBarcodeContainerView.constant = WRATIO_WIDTH(350.0f);
    
    
    [self setColor];
    [self setAutoLayout];

}

-(void)viewWillAppear:(BOOL)animated
{
    self.lbMiddleNotice.text = [self.library.mainInfo eventTitle];
    LogBlue(@"title : %@", [self.library.mainInfo eventTitle]);
    
    self.bannerUrlString = [self.library.mainInfo bannerUri];
    
    LogYellow(@"banner Height : %zd", [self.library.mainInfo bannerUriHeight]);
    self.alcHeightOfBanner.constant = HRATIO_HEIGHT([self.library.mainInfo bannerUriHeight]);
    
    self.lbUserEmail.text = [self.library.userInfo userId];
    self.lbUserName.text = [self.library.userInfo userName];
    
    NSLog(@"userInfo : %@", self.library.userInfo);
    
    self.lbAvailablePoint.text = [NSString stringWithFormat:@"%ld", (long)[self.library.userInfo point]];
    [self startDownLoadBanner];
    [self startDownLoadImage];
    
    if([self.library.userInfo cardNo])
    {
        LogYellow(@"cardno : %@", [self.library.userInfo cardNo]);
        NSMutableString *cardString = [NSMutableString stringWithString:[self.library.userInfo cardNo]];
        [cardString insertString:@" " atIndex:4];
        [cardString insertString:@" " atIndex:9];
        [cardString insertString:@" "  atIndex:14];
        self.lbBarcode.text = cardString;
        
        //라벨 세로정렬
        [self.lbBarcode setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
        
        self.ivBarcode.image = [self.library generateVerticalBarcodeImgWithBarcode:[self.library.userInfo cardNo]];
    }

}
- (IBAction)touchedEnlargeButton:(id)sender
{
    BarcodeViewController *barcodeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-barcodeView"];
    
    [self.mainVC presentViewController:barcodeVC animated:YES completion:nil];
    
}

-(void)startDownLoadImage
{
    NSURLSessionDataTask *sessionTask;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.library.userInfo profileImg]]];
    sessionTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        UIImage *userImage = [[UIImage alloc] initWithData: data] ;

        dispatch_async(dispatch_get_main_queue(), ^{
            self.ivUser.image = userImage;
        });
    }];
    
    [sessionTask resume];
}

-(void)startDownLoadBanner
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.bannerUrlString]];
    NSURLSessionTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        UIImage *image = [[UIImage alloc]initWithData:data];
        
        if(image != nil)
        {
            self.ivBanner.image = image;
        }
        }];
    
        [dataTask resume];
}

- (IBAction)touchedHideBanner:(id)sender
{
    self.alcTopOfBannerView.constant = -78.0f;
    NSTimeInterval animationDuration = 0.25f;
    
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0.0f options:animationOptions animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:nil];
}


#pragma mark - Set UI

-(void)setColor
{
    self.ivNavigationBottomColor.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    self.view.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.lbUserName.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbUserEmail.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbAvailablePoint.textColor = [self.util getColorWithRGBCode:@"424242"];
    self.lbShowPoint.textColor = [self.util getColorWithRGBCode:@"333333"];
    
    self.ivMenuBottomColor.backgroundColor = [self.util getColorWithRGBCode:@"e6e6dd"];
    
    self.navigationContainerView.backgroundColor = [self.util getColorWithRGBCode:@"ffffff"];
    self.menuContainerView.backgroundColor = [self.util getColorWithRGBCode:@"ffffff"];
    self.userInfoContainerView.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.pointContainerView.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.labelContainerView.backgroundColor = [self.util getColorWithRGBCode:@"f0f0e4"];
    self.ivCenterLine.backgroundColor = [self.util getColorWithRGBCode:@"f0f0e4"];
    
    self.ivMenuBottomPinkColor.backgroundColor = [self.util getColorWithRGBCode:@"f386a1"];
    
    self.lbMiddleNotice.textColor = [self.util getColorWithRGBCode:@"757575"];

}

-(void)setAutoLayout
{
    self.alcHeightOfNaviagtionBar.constant = WRATIO_WIDTH(213);
    
    self.alcWidthOfHomeView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfPointView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfCardView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfStoreView.constant = QUARTER_OF_WIDTH;
    self.alcWidthOfIndicator.constant = QUARTER_OF_WIDTH;
    
    self.alcTopOfNoticeView.constant = WRATIO_WIDTH(69);
    self.alcLeadingOfNoticeView.constant = WRATIO_WIDTH(63);
    self.alcTrailingOfNoticeView.constant = WRATIO_WIDTH(36);
    self.alcHeightOfNoticeView.constant = WRATIO_WIDTH(132);
    
    self.alcTopOfUserInfoView.constant = WRATIO_WIDTH(108);
    self.alcLeadingOfUserView.constant = WRATIO_WIDTH(36);
    self.alcHeightOfUserView.constant = WRATIO_WIDTH(366);
    self.alcWidthOfUserView.constant = WRATIO_WIDTH(579);
    
    self.alcTopOfUsername.constant = WRATIO_WIDTH(50);
    
    self.alcTopOfPointView.constant = WRATIO_WIDTH(108);
    self.alcTrailingOfPointView.constant = WRATIO_WIDTH(63);
    self.alcHeightOfPointView.constant =   WRATIO_WIDTH(366);
    self.alcWidthOfPointViewContainer.constant = WRATIO_WIDTH(582);
    
    self.alcTopOfAvailablePoint.constant = WRATIO_WIDTH(45);
    
    self.alcHeightOfMiddleLine.constant = WRATIO_WIDTH(366);
    
    self.alcTopOfCard.constant = WRATIO_WIDTH(110.0f);
    self.alcLeadingOfCard.constant = WRATIO_WIDTH(39);
    self.alcTrailingOfCard.constant = WRATIO_WIDTH(39);
    
    self.alcWidthOfMiddleBell.constant = WRATIO_WIDTH(57);
    self.alcHeightOfMiddleBell.constant = WRATIO_WIDTH(63);
    
    self.alcHeightOfUserImage.constant = WRATIO_WIDTH(195);
    self.alcWidthOfUserImage.constant = WRATIO_WIDTH(195);
    
    self.alcWidthOfTopImage.constant = WRATIO_WIDTH(729);
    self.alcHeightOfTopImage.constant  = WRATIO_WIDTH(54);
    
    self.alcWidthOfMenuImage.constant = WRATIO_WIDTH(75);
    self.alcHeightOfMenuImage.constant = WRATIO_WIDTH(51);
    
    self.alcHeightOfMenuBar.constant = WRATIO_WIDTH(147);
    self.alcHeightOfHomeMenu.constant = WRATIO_WIDTH(147);
    self.alcHeightOfPointMenu.constant = WRATIO_WIDTH(147);
    self.alcHeightOfCardMenu.constant = WRATIO_WIDTH(147);
    self.alcHeightOfStoreMenu.constant = WRATIO_WIDTH(147);
    
    self.alcWidthOfVIP.constant = WRATIO_WIDTH(102);
    self.alcHeightOfVIP.constant = WRATIO_WIDTH(49);
    
    self.alcTopOfShowPoint.constant = WRATIO_WIDTH(42);
    
    self.alcBottomOfTopImage.constant = WRATIO_WIDTH(54);
    self.alcBottomOfTopMenuImage.constant = WRATIO_WIDTH(54);
    
    self.lbUserName.font = [UIFont systemFontOfSize:WRATIO_WIDTH(48)];
    self.lbUserEmail.font = [UIFont systemFontOfSize:WRATIO_WIDTH(36)];
    self.lbAvailablePoint.font = [UIFont systemFontOfSize:WRATIO_WIDTH(117)];
    self.lbShowPoint.font = [UIFont systemFontOfSize:WRATIO_WIDTH(45)];
    self.lbPoint.font = [UIFont systemFontOfSize:WRATIO_WIDTH(51)];
    
    self.lbMiddleNotice.font = [UIFont systemFontOfSize:WRATIO_WIDTH(48)];

    self.alcCenterOfUserName.constant = self.alcCenterOfUserName.constant- WRATIO_WIDTH(102)/2;
    
    self.lbUserName.preferredMaxLayoutWidth = DEVICE_WIDTH - WRATIO_WIDTH(10)*2 - 1.0f - WRATIO_WIDTH(102);
    
    self.alcWidthOfBarcodeIcon.constant = WRATIO_WIDTH(63.0f);
    self.alcHeightOfBarcodeIcon.constant = WRATIO_WIDTH(63.0f);
    
    
 
}


@end

