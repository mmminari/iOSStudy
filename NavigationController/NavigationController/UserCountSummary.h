//
//  UserCountSummary.h
//
//  Created by   on 2016. 11. 14.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UserCountSummary : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id celebrity;
@property (nonatomic, assign) id following;
@property (nonatomic, assign) double userIdx;
@property (nonatomic, assign) id follower;
@property (nonatomic, assign) id artWork;
@property (nonatomic, assign) id like;
@property (nonatomic, assign) id curation;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
