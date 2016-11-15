//
//  MainPageBannerCell.h
//  NavigationController
//
//  Created by 김민아 on 2016. 11. 14..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainPageBannerCellDelegate <NSObject>

@required
- (void)didTouchPreviousButtonWithIndex:(NSInteger)index;
- (void)didTouchNextButtonWithIndex:(NSInteger)index;

@end

@interface MainPageBannerCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ivBanner;
@property (assign, nonatomic) NSInteger index;
@property (assign, nonatomic) NSInteger maxIndex;

@property (weak, nonatomic)  id<MainPageBannerCellDelegate> delegate;

- (void)hideBannerMoveButtonWithIndex:(NSInteger)index;


@end
