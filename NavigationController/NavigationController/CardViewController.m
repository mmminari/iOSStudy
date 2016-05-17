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

@interface CardViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivCard;
@property (weak, nonatomic) IBOutlet UIImageView *ivBarcode;
@property (weak, nonatomic) IBOutlet UIButton *btnEnlargeCode;

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


@end


@implementation CardViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setColorAndImages];
    
    NSMutableString *cardString = [NSMutableString stringWithString:[self.userInfo cardNo]];
    [cardString insertString:@" " atIndex:4];
    [cardString insertString:@" " atIndex:9];
    [cardString insertString:@" "  atIndex:14];
    self.lbBarcodeNum.text = cardString;
    
    NSString *showGrade = @"회원등급: ";
    NSString *grade = [self.userInfo strUserGrade];
    showGrade = [showGrade stringByAppendingString:grade];
    
    self.lbShowGrade.text = showGrade;
    
    self.menuArr = @[@"카드 새로 등록하기", @"카드 비밀번호 변경", @"카드 분실 신고", @"구매인증 코드 등록"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Seoul"];

    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
    dateFormatter.timeZone = timeZone;

    NSString *string = [self.userInfo cardRegdate];
    NSDate *date = [dateFormatter dateFromString:string];

    dateFormatter.dateFormat = @"yyyy.MM.dd";
    NSString *dateString = [dateFormatter stringFromDate:date ];
    
    NSString *showDate = @"카드 등록일: ";
    showDate = [showDate stringByAppendingString:dateString];
    
    self.lvShowEnrollDate.text  = showDate;
    
    self.tbMenu.rowHeight = WRATIO_WIDTH(162.0f);
    self.alcHeightOfIvLabelSep.constant = WRATIO_WIDTH(39.0f);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CardCell";
    
    CardCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
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
}

-(void)setColorAndImages
{
    self.view.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.ivBarcode.backgroundColor = [self.util getColorWithRGBCode:@"ffffff"];
    
    self.ivCard.image = [UIImage imageNamed:@"img_card_sub"];
    self.btnEnlargeCode.imageView.image = [UIImage imageNamed:@"btn_card_largeimg_sub"];
    
    self.ivCard.layer.cornerRadius = 8.0f;
    self.ivBarcode.layer.cornerRadius = 8.0f;
    self.btnEnlargeCode.layer.masksToBounds = YES;
    
    self.lbShowGrade.textColor = [self.util getColorWithRGBCode:@"7c7c7c"];
    self.lvShowEnrollDate.textColor = [self.util getColorWithRGBCode:@"7c7c7c"];
    self.lbShowGrade.font = [UIFont systemFontOfSize:WRATIO_WIDTH(39.0f)];
    self.lvShowEnrollDate.font = [UIFont systemFontOfSize:WRATIO_WIDTH(39.0f)];
    
    self.lbBarcodeNum.font = [UIFont systemFontOfSize:WRATIO_WIDTH(33.0f)];
    self.ivLabelSep.backgroundColor = [self.util getColorWithRGBCode:@"7c7c7c"];
    
    self.tbMenu.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"sgCardToEnlargeView"])
    {
        BarcodeViewController *barcVC = [segue destinationViewController];
        barcVC.barString = [self.userInfo cardNo];
        
    }
}

- (IBAction)touchedShowBarcode:(id)sender {
    MainViewController *mainVC = [[MainViewController alloc]init];
    [mainVC touchedShowBarcode];
}


@end
