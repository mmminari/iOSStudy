//
//  StoreCell.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 18..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreViewController.h"
#import "MainViewController.h"
#import "StoreLocationViewController.h"

@interface StoreCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ivMain;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbSaleInfo;
@property (weak, nonatomic) IBOutlet UILabel *lbDetail;
@property (weak, nonatomic) IBOutlet UILabel *lbLocation;
@property (weak, nonatomic) IBOutlet UILabel *lbPhoneNum;

@property (weak, nonatomic) IBOutlet UIImageView *ivLocation;
@property (weak, nonatomic) IBOutlet UIImageView *ivPhone;

@property (strong, nonatomic) StoreViewController *storeVC;
@property (strong, nonatomic) MainViewController *mainVC;
@property (strong, nonatomic) StoreLocationViewController *mapVC;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfExplain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfExplain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfDetail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfDetail;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfAddress;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfAddress;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfPhone;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfPhone;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfLocImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfPhoImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfLocImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfPhoImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbLocation;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfLbPhone;

@end
