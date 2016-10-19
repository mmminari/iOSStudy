//
//  AlbumView.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "AlbumView.h"

@implementation AlbumView
{
    UIImageView *coverImage;
    UIActivityIndicatorView *indicator;
}

-(id)initWithFrame:(CGRect)frame albumCover:(NSString *)albumCover
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.backgroundColor = [UIColor blackColor];
        
        coverImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, frame.size.width - 10, frame.size.height - 10)];
        [self addSubview:coverImage];
        
        indicator = [[UIActivityIndicatorView alloc]init];
        indicator.center = self.center;
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [indicator startAnimating];
        [self addSubview:indicator];
        
        [coverImage addObserver:self forKeyPath:@"image" options:0 context:nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BLDownloadImageNotification" object:self userInfo:@{@"imageView":coverImage, @"coverUrl":albumCover}];
        
    }
    

    
    return self;
}

- (void)dealloc
{
    [coverImage removeObserver:self forKeyPath:@"image"];
}

- (void)oserverValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"image"])
    {
        [indicator stopAnimating];
    }
}


@end
