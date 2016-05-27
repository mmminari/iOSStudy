//
//  MainViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UserInformation.h"


@interface MainViewController : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource>


@property (strong, nonatomic) UserInformation *userInfo;

-(void)setContentViewLayoutWithSubView:(UIView *)subView withTargetView:(UIView *)targetView;
-(void)touchedShowBarcode;
-(void)moveToTheTargetViewWithStid:(NSString *)stid MenuList:(MenuList)list;


@end
