//
//  EventCell.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbSubTitle;
@property (weak, nonatomic) IBOutlet UIImageView *ivButton;


@end
