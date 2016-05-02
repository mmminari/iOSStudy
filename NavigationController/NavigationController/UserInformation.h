//
//  UserInformation.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

-(void)setUserNameWithString:(NSString *)name;
-(BOOL)getResult;
-(void)setResultWithBoolean:(BOOL)result;
-(NSString *)getUserName;


@end
