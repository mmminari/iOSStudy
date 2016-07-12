//
//  Photos.h
//
//  Created by   on 2016. 7. 12.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photos : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *photo;
@property (nonatomic, assign) double pages;
@property (nonatomic, assign) double perpage;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) double page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
