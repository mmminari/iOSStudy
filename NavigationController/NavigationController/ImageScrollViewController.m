//
//  ImageScrollViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ImageScrollViewController.h"

@interface ImageScrollViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scImage;


@end

@implementation ImageScrollViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *imageArr = @[@"sc1.jpg", @"sc2.jpg", @"sc3.jpg", @"sc4.jpg", @"sc5.jpg", @"sc6.jpg"];
    CGFloat height = 0.0f;
    
    for (NSString *imageName in imageArr)
    {
        UIImage *image = [UIImage imageNamed:imageName];
        CGFloat imageHeight = DEVICE_HEIGHT * image.size.width / DEVICE_WIDTH / 3;
        LogGreen(@"image height : %f", imageHeight);
        UIImageView *ivBackground = [[UIImageView alloc]initWithImage:image];
        ivBackground.frame = CGRectMake(0, height, DEVICE_WIDTH, imageHeight);
        [self.scImage addSubview:ivBackground];
        height = height + imageHeight;
        LogGreen(@" height : %f", height);

    }

    [self.scImage setContentSize:CGSizeMake(DEVICE_WIDTH, height)];

    [self.view addSubview:self.scImage];
    
}


@end
