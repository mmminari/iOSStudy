//
//  HorizontalScroller.h
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 11..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol HorizontalScrollerDelegate;

@interface HorizontalScroller : UIView

@property (weak) id<HorizontalScrollerDelegate> delegate;

- (void)reload;


@end


@protocol HorizontalScrollerDelegate <NSObject>

@required

- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller *)scroller;
- (UIView *)horizontalScroller:(HorizontalScroller *)scroller viewAtIndex:(int)index;
- (void)horizontalScroller:(HorizontalScroller *)scroller clickedVIewAtIndex:(int)index;

@optional

- (NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller;


@end
