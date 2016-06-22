//
//  ShowMenuViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 23..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ShowMenuViewController : BaseViewController

@property (strong, nonatomic) NSString *titleString;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIView *navigationView;
@property (weak, nonatomic) IBOutlet UIImageView *ivBack;

@property (strong, nonatomic) BaseViewController *baseVC;


@end
