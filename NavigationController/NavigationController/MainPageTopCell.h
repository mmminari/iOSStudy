//
//  MainPageTopCell.h
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 13..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPageTopCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UICollectionView *cvHorizontal;


@property (strong, nonatomic) NSArray *mainCoverList;




- (void)startAutoScroll;
- (void)stopAutoScroll;


@end
