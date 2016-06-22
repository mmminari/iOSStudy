//
//  ScriptResults.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 21..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UtilityClass.h"

@interface ScriptResults : UtilityClass

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *action;
@property (strong, nonatomic) NSString *naviTitle;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *param;


-(instancetype)initWithScriptResults:(id)results;



@end
