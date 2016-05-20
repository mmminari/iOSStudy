//
//  StoreCell.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 18..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreViewController.h"


@interface StoreCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ivMain;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbSaleInfo;
@property (weak, nonatomic) IBOutlet UILabel *lbDetail;
@property (weak, nonatomic) IBOutlet UILabel *lbLocation;
@property (weak, nonatomic) IBOutlet UILabel *lbPhoneNum;

@property (weak, nonatomic) IBOutlet UIImageView *ivLocation;
@property (weak, nonatomic) IBOutlet UIImageView *ivPhone;

@property (strong, nonnull) StoreViewController *storeVC;

@end
