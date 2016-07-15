//
//  ThumbnailCell.h
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 11..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ThumbnailDelegate <NSObject>

@required
-(void)didTouchDeletebuttonWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface ThumbnailCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ivThumbnail;
@property (weak, nonatomic) id<ThumbnailDelegate> delegate;
@property (strong, nonatomic) NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UIImageView *ivDelete;
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;

@end
