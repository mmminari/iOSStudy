//
//  LibraryClass.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 3..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInformation.h"

@interface LibraryClass : NSObject


//introInfo

@property (assign, nonatomic) NSInteger backgroundWidth;
@property (assign, nonatomic) NSInteger backgroundHeight;
@property (strong, nonatomic) NSString *backgroundUri;

@property (assign, nonatomic) NSInteger contentWidth;
@property (assign, nonatomic) NSInteger contentHeight;
@property (strong, nonatomic) NSString *contentUri;

@property (assign, nonatomic) NSInteger contentBackgroundWidht;
@property (assign, nonatomic) NSInteger contentBackgroundHeight;
@property (strong, nonatomic) NSString *contentBackgroundUri;

//textEvent
@property (strong, nonatomic) NSString *eventTitle;


//imageEvent
@property (strong, nonatomic) NSString *bannerUri;



+ (instancetype)sharedInstance;
-(void)initWithResults:(NSDictionary *)results;



@end
