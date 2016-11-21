//
//  EpisodeView.m
//  NavigationController
//
//  Created by 김민아 on 2016. 11. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "EpisodeView.h"

@interface EpisodeView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfLbEpName;

@end

@implementation EpisodeView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //self.alcLeadingOfLbEpName.constant = - 100.0f;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.lbEpName.alpha = 0.0f;
}

- (void)initLayout
{
    self.alcLeadingOfLbEpName.constant = -100.0f;
}


- (void)startAnimation
{

    [UIView animateWithDuration:0.4f animations:^{
        
        self.alcLeadingOfLbEpName.constant = 10.0f;
        self.lbEpName.alpha = 1.0f;
        [self layoutIfNeeded];
        
    }];
    

}

@end
