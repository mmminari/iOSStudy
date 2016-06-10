//
//  LogOutCollectionViewController.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface LogOutCollectionViewController : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *cvLogOut;
@property (weak, nonatomic) NSArray *introList;

@end
