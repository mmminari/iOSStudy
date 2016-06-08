//
//  IntroInformation.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 8..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface IntroInformation : BaseModel

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


-(instancetype)initWithInfoDic:(NSDictionary *)results;


@end
