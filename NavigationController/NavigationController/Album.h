//
//  Album.h
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject <NSCoding>

@property (nonatomic, copy, readonly) NSString *title, *artist, *genre, *coverUrl, *year;

-(id)initWithTitle:(NSString *)title artist:(NSString *)artist coverUrl:(NSString *)coverUrl year:(NSString *)year;

@end
