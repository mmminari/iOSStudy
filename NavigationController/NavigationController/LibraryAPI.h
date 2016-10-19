//
//  LibraryAPI.h
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface LibraryAPI : NSObject

+ (LibraryAPI *)sharedInstance;


- (NSArray*)getAlbums;
- (void)addAlbum:(Album*)album atIndex:(int)index;
- (void)deleteAlbumAtIndex:(int)index;

- (void)saveAlbums;

@end
