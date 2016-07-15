//
//  ThumbnailCell.m
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 11..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ThumbnailCell.h"

@implementation ThumbnailCell


- (IBAction)didTouchDeleteBtn:(id)sender
{
    [self.delegate didTouchDeletebuttonWithIndexPath:self.indexPath];
}


@end
