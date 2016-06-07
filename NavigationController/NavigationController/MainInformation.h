//
//  MainInformation.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 1..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"

@interface MainInformation : BaseViewController

//introInfo


//textEvent
@property (strong, nonatomic) NSString *eventTitle;


//imageEvent
@property (strong, nonatomic) NSString *bannerUri;




-(instancetype)initWithResults:(NSDictionary *)results lagCode:(NSString *)lagCode;

@end
