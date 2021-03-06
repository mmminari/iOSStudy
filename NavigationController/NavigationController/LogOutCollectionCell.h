//
//  LogOutCollectionCell.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogOutCollectionCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *ivBackground;
@property (weak, nonatomic) IBOutlet UIImageView *ivContent;
@property (weak, nonatomic) IBOutlet UIImageView *ivContentBackground;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfIvContent;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfIvContent;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfContainerView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfIvContent;

@end
