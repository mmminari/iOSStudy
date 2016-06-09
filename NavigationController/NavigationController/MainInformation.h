//
//  MainInformation.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 1..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "IntroInformation.h"

@interface MainInformation : BaseModel


//textEvent
@property (strong, nonatomic) NSString *eventTitle;


//imageEvent
@property (strong, nonatomic) NSString *bannerUri;
@property (assign, nonatomic) NSInteger bannerUriWidth;
@property (assign, nonatomic) NSInteger bannerUriHeight;

@property (strong, nonatomic) NSArray *introList;

-(instancetype)initWithResults:(id)results;


@end
