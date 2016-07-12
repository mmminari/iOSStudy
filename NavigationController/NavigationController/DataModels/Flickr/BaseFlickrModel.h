//
//  BaseFlickrModel.h
//
//  Created by   on 2016. 7. 12.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Photos;

@interface BaseFlickrModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *stat;
@property (nonatomic, strong) Photos *photos;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
