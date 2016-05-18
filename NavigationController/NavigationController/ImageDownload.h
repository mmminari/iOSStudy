//
//  ImageDownload.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 18..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoreCell.h"

@interface ImageDownload : NSObject

@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSMutableArray *imageArr;

-(void)stardDownload;
@property (strong, nonatomic) StoreCell *sCell;

@property (nonatomic, copy) void (^completionHandler)(void);



@end
