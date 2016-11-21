//
//  EpEpisodeModel.h
//
//  Created by   on 2016. 11. 21.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface EpEpisodeModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL result;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *nextOpenMonth;
@property (nonatomic, assign) double mainEpisodeNo;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
