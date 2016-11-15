//
//  Thumb.h
//
//  Created by   on 2016. 11. 14.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Thumb : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isMain;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, assign) id fileName;
@property (nonatomic, assign) id order;
@property (nonatomic, strong) NSString *imageKey;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, assign) id thumbType;
@property (nonatomic, assign) id desc;
@property (nonatomic, assign) id url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
