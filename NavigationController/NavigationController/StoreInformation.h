//
//  StoreInformation.h
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 18..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface StoreInformation : BaseModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *saleInfo;
@property (strong, nonatomic) NSString *explain;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *imageInfoUri;
@property (strong, nonatomic) NSString *imageInfoHeight;
@property (strong, nonatomic) NSString *imageInfoWidth;


-(instancetype)initWithResults:(NSDictionary *)results;



@end
