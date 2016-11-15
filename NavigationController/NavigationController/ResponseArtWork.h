//
//  ResponseArtWork.h
//
//  Created by   on 2016. 11. 14.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Thumb, User;

@interface ResponseArtWork : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) NSString *cuNickName;
@property (nonatomic, strong) NSString *artworkShareUrl;
@property (nonatomic, strong) NSString *locale;
@property (nonatomic, assign) id artWorkMovie;
@property (nonatomic, strong) NSString *artWorkTitle;
@property (nonatomic, strong) NSString *lang;
@property (nonatomic, assign) id artWorkListImage;
@property (nonatomic, assign) double isActiveAdmin;
@property (nonatomic, assign) double isContest;
@property (nonatomic, strong) Thumb *thumb;
@property (nonatomic, assign) double artWorkType;
@property (nonatomic, assign) id reserveDateSet;
@property (nonatomic, assign) id reserveHourSet;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, assign) id selfInspection;
@property (nonatomic, assign) BOOL hasBadge;
@property (nonatomic, assign) double artWorkKind;
@property (nonatomic, assign) BOOL following;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *artWorkDesc;
@property (nonatomic, assign) id selfInclude;
@property (nonatomic, assign) BOOL like;
@property (nonatomic, assign) id reserveMinuteSet;
@property (nonatomic, assign) double isActive;
@property (nonatomic, assign) double cuCount;
@property (nonatomic, assign) double hitCount;
@property (nonatomic, assign) BOOL hasCeleb;
@property (nonatomic, assign) double createDate;
@property (nonatomic, strong) NSString *cuTitle;
@property (nonatomic, assign) id artWorkThumb;
@property (nonatomic, assign) double artWorkOpenDate;
@property (nonatomic, assign) BOOL reserveSet;
@property (nonatomic, assign) id artWorkAttache;
@property (nonatomic, assign) double artWorkIdx;
@property (nonatomic, strong) NSString *artWorkHashTag;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
