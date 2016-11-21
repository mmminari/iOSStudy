//
//  MainContainerView.m
//  NavigationController
//
//  Created by 김민아 on 2016. 11. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MainContainerView.h"
#import "EpisodeView.h"
#import "LibraryClass.h"
#import "EpEpisodeModels.h"

@interface MainContainerView () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scEpisode;

@property (strong, nonatomic) LibraryClass *lib;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfScrollView;


@end

@implementation MainContainerView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.alcWidthOfScrollView.constant = [UIScreen mainScreen].bounds.size.width;
    self.alcHeightOfScrollView.constant = [UIScreen mainScreen].bounds.size.height;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.lib = [LibraryClass sharedInstance];
    
    self.scEpisode.delegate = self;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    LogGreen(@"self.epList.count : %zd", self.epList.count);
    
    self.scEpisode.contentSize = CGSizeMake(screenWidth * self.epList.count ,screenHeight);
    
    for (int i = 0 ; i < self.epList.count; i++)
    {
        EpisodeView *epView = nil;
        EpList *episode = self.epList[i];
        
        if(epView == nil)
        {
            epView = [[[NSBundle mainBundle] loadNibNamed:@"EpisodeView" owner:self options:nil]lastObject];
            epView.frame = CGRectMake(screenWidth *i, 0, screenWidth, screenHeight);
            
            epView.lbEpName.text = episode.eName;
            
    
            [self.lib setImageView:epView.ivEpisode urlString:episode.eMainImgUrl placeholderImage:nil animation:YES completed:^(BOOL complete) {
                
                if(i == 0)
                {
                    [epView startAnimation];
                }
            }];
            
            epView.tag = 100 + i;
            
            [epView initLayout];
            
            LogGreen(@"epView.tag : %zd", epView.tag);
            
        }
        
        
        [self.scEpisode addSubview:epView];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    
    NSInteger tagNum = 100 + index;
    
    LogGreen(@"tagNum : %zd", tagNum);
    
    EpisodeView *epView = (EpisodeView *)[self viewWithTag:tagNum];
    
    [epView startAnimation];
    
    
}

@end
