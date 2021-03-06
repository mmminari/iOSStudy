//
//  CardViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "CardViewController.h"
#import "BarcodeViewController.h"
#import "CardCell.h"
#import "MainViewController.h"
#import "RegCardViewController.h"
#import "ChangePwViewController.h"
#import "ReportCardLossViewController.h"
#import "RegCodeViewController.h"

@interface CardViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivCard;
@property (weak, nonatomic) IBOutlet UIImageView *ivBarcode;
@property (weak, nonatomic) IBOutlet UIImageView *ivBarcodeImg;

@property (weak, nonatomic) IBOutlet UILabel *lbBarcodeNum;
@property (weak, nonatomic) IBOutlet UILabel *lbShowGrade;
@property (weak, nonatomic) IBOutlet UILabel *lvShowEnrollDate;
@property (weak, nonatomic) IBOutlet UITableView *tbMenu;
@property (weak, nonatomic) IBOutlet UITableViewCell *cardCell;
@property (weak, nonatomic) IBOutlet UIView *cardContentView;

@property (strong, nonatomic) NSArray *menuArr;
@property (weak, nonatomic) IBOutlet UIImageView *ivBackIcon;
@property (weak, nonatomic) IBOutlet UIImageView *ivLabelSep;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfIvLabelSep;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCardIv;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfCardIv;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfBarcode;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfBarImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfBarImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfBarImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfBarImg;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfIvCard;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfIvBarcode;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfIvBarcode;

@property (strong, nonatomic) RegCardViewController *regVC;
@property (strong, nonatomic) ChangePwViewController *changeVC;
@property (strong, nonatomic) ReportCardLossViewController *reportVC;
@property (strong, nonatomic) RegCodeViewController *regCodeVC;

@end


@implementation CardViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setColorAndImages];
    
    self.regVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-regCardView"];
    self.changeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-changePwView"];
    self.reportVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-ReportCardLossView"];
    self.regCodeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-RegCodeView"];
    
    NSMutableString *cardString = [NSMutableString stringWithString:[self.library.userInfo cardNo]];
    [cardString insertString:@" " atIndex:4];
    [cardString insertString:@" " atIndex:9];
    [cardString insertString:@" "  atIndex:14];
    self.lbBarcodeNum.text = cardString;
    
    NSString *showGrade = @"회원등급: ";
    NSString *grade = [self.library.userInfo strUserGrade];
    showGrade = [showGrade stringByAppendingString:grade];
    
    self.lbShowGrade.text = showGrade;
    
    self.menuArr = @[@"카드 새로 등록하기", @"카드 비밀번호 변경", @"카드 분실 신고", @"구매인증 코드 등록"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Seoul"];

    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
    dateFormatter.timeZone = timeZone;

    NSString *string = [self.library.userInfo cardRegdate];
    NSDate *date = [dateFormatter dateFromString:string];

    dateFormatter.dateFormat = @"yyyy.MM.dd";
    NSString *dateString = [dateFormatter stringFromDate:date ];
    
    NSString *showDate = @"카드 등록일: ";
    showDate = [showDate stringByAppendingString:dateString];
    
    self.lvShowEnrollDate.text  = showDate;
    
    self.tbMenu.rowHeight = WRATIO_WIDTH(162.0f);
    self.alcHeightOfIvLabelSep.constant = WRATIO_WIDTH(39.0f);
    
    [self setLayout];
    
    self.ivBarcodeImg.image = [self.library genergateBarcodeWithCode:[self.library.userInfo cardNo]];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    NSMutableString *cardString = [NSMutableString stringWithString:[self.library.userInfo cardNo]];
    [cardString insertString:@" " atIndex:4];
    [cardString insertString:@" " atIndex:9];
    [cardString insertString:@" "  atIndex:14];
    self.lbBarcodeNum.text = cardString;
}

#pragma mark - TableView

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CardCell";
    
    CardCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[CardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = self.menuArr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:WRATIO_WIDTH(42.0f)];
    cell.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    cell.textLabel.textColor = [self.util getColorWithRGBCode:@"424242"];

    cell.contentView.layer.borderColor = [self.util getColorWithRGBCode:@"c2c0ba"].CGColor;
    cell.ivBack.image = [UIImage imageNamed:@"btn_menu_go"];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.menuArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selected = NO;
    
    BaseViewController *baseVC = nil;
    
    if(indexPath.row == 0)
    {
        [self.mainVC.navigationController pushViewController:self.regVC animated:YES];
        baseVC = self.regVC;
    }
    else if (indexPath.row == 1)
    {
        [self.mainVC.navigationController pushViewController:self.changeVC animated:YES];
        baseVC = self.changeVC;
    }
    else if (indexPath.row == 2)
    {
        [self.mainVC.navigationController pushViewController:self.reportVC animated:YES];
        baseVC = self.reportVC;
    }
    else if (indexPath.row == 3)
    {
        [self.mainVC.navigationController pushViewController:self.regCodeVC animated:YES];
        baseVC = self.regCodeVC;
    }
    
    [baseVC setTitleOfNavibarWithIndexPath:indexPath];
}

#pragma mark - UI

-(void)setColorAndImages
{
    self.view.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.ivBarcode.backgroundColor = [self.util getColorWithRGBCode:@"ffffff"];
    
    self.ivCard.image = [UIImage imageNamed:@"img_card_sub"];
    self.btnEnlargeCode.imageView.image = [UIImage imageNamed:@"btn_card_largeimg_sub"];
    
    self.ivCard.layer.cornerRadius = WRATIO_WIDTH(24.0f);
    self.ivBarcode.layer.cornerRadius = WRATIO_WIDTH(24.0f);
    self.btnEnlargeCode.layer.masksToBounds = YES;
    
    self.lbShowGrade.textColor = [self.util getColorWithRGBCode:@"7c7c7c"];
    self.lvShowEnrollDate.textColor = [self.util getColorWithRGBCode:@"7c7c7c"];
    self.lbShowGrade.font = [UIFont systemFontOfSize:WRATIO_WIDTH(39.0f)];
    self.lvShowEnrollDate.font = [UIFont systemFontOfSize:WRATIO_WIDTH(39.0f)];
    
    self.lbBarcodeNum.font = [UIFont systemFontOfSize:WRATIO_WIDTH(33.0f)];
    self.ivLabelSep.backgroundColor = [self.util getColorWithRGBCode:@"7c7c7c"];
    
    self.tbMenu.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];

}

-(void)setLayout
{
    self.alcWidthOfCardIv.constant = WRATIO_WIDTH(1164.0f);
    self.alcHeightOfCardIv.constant = HRATIO_HEIGHT(728.0f);
    self.alcTopOfTableView.constant = HRATIO_HEIGHT(123.0f);
    self.alcHeightOfBtn.constant = HRATIO_HEIGHT(63.0f);
    self.alcWidthOfBtn.constant  = WRATIO_WIDTH(63.0f);
    self.alcBottomOfBtn.constant = WRATIO_WIDTH(-27.0f);
    self.alcBottomOfBarcode.constant = WRATIO_WIDTH(-30.0f);
    self.alcTopOfBarImg.constant = HRATIO_HEIGHT(415.0f);
    self.alcLeadingOfBarImg.constant = WRATIO_WIDTH(75.0f);
    self.alcTrailingOfBarImg.constant = WRATIO_WIDTH(-75.0f);
    self.alcBottomOfBarImg.constant = HRATIO_HEIGHT(-75.0f);
    self.alcTopOfIvCard.constant = WRATIO_WIDTH(84.0f);
    self.alcHeightOfIvBarcode.constant = HRATIO_HEIGHT(117.0f);
    self.alcTopOfIvBarcode.constant = HRATIO_HEIGHT(42.0f);
}



#pragma mark - touched Event

- (IBAction)touchedShowBarcode:(id)sender
{
    [self.mainVC performSegueWithIdentifier:@"sgMainToBarcode" sender:self];
    
}



@end
