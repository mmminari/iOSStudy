//
//  MainPageBannerCell.m
//  NavigationController
//
//  Created by 김민아 on 2016. 11. 14..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainPageBannerCell.h"

@interface MainPageBannerCell ()

@property (weak, nonatomic) IBOutlet UIButton *btnPrevious;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@end

@implementation MainPageBannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - User Action

- (IBAction)didTouchPreviousButton:(UIButton *)sender {
    
    if([self.delegate respondsToSelector:@selector(didTouchPreviousButtonWithIndex:)])
    {
        [self.delegate didTouchPreviousButtonWithIndex:self.index];
    }
}

- (IBAction)didTouchNextButton:(UIButton *)sender {
    
    if([self.delegate respondsToSelector:@selector(didTouchNextButtonWithIndex:)])
    {
        [self.delegate didTouchNextButtonWithIndex:self.index];
    }
}

#pragma mark - Public Method

- (void)hideBannerMoveButtonWithIndex:(NSInteger)index
{
    if(index == 0)
    {
        self.btnPrevious.hidden = YES;
        self.btnNext.hidden = NO;
    }
    else if(index == self.maxIndex)
    {
        self.btnNext.hidden = YES;
        self.btnPrevious.hidden = NO;
    }
    else
    {
        self.btnNext.hidden = NO;
        self.btnPrevious.hidden = NO;
    }
    
}

@end
