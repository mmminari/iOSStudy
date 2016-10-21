//
//  PersistencyManager.h
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Album.h"

@interface PersistencyManager : NSObject

- (NSArray *)getAlbums;
- (void)adddAlbum:(Album *)album atIndex:(NSInteger)index;
- (void)deleteAlbumAtIndex:(NSInteger)index;

- (void)saveImage:(UIImage *)image filename:(NSString *)filename;
- (UIImage *)getImage:(NSString *)filename;

- (void)saveAlbums;

@end
