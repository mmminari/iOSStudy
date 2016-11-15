//
//  ResponseArtWork.m
//
//  Created by   on 2016. 11. 14.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ResponseArtWork.h"
#import "Thumb.h"
#import "User.h"


NSString *const kResponseArtWorkLikeCount = @"likeCount";
NSString *const kResponseArtWorkCuNickName = @"cuNickName";
NSString *const kResponseArtWorkArtworkShareUrl = @"artworkShareUrl";
NSString *const kResponseArtWorkLocale = @"locale";
NSString *const kResponseArtWorkArtWorkMovie = @"artWorkMovie";
NSString *const kResponseArtWorkArtWorkTitle = @"artWorkTitle";
NSString *const kResponseArtWorkLang = @"lang";
NSString *const kResponseArtWorkArtWorkListImage = @"artWorkListImage";
NSString *const kResponseArtWorkIsActiveAdmin = @"isActiveAdmin";
NSString *const kResponseArtWorkIsContest = @"isContest";
NSString *const kResponseArtWorkThumb = @"thumb";
NSString *const kResponseArtWorkArtWorkType = @"artWorkType";
NSString *const kResponseArtWorkReserveDateSet = @"reserveDateSet";
NSString *const kResponseArtWorkReserveHourSet = @"reserveHourSet";
NSString *const kResponseArtWorkCommentCount = @"commentCount";
NSString *const kResponseArtWorkSelfInspection = @"selfInspection";
NSString *const kResponseArtWorkHasBadge = @"hasBadge";
NSString *const kResponseArtWorkArtWorkKind = @"artWorkKind";
NSString *const kResponseArtWorkFollowing = @"following";
NSString *const kResponseArtWorkUser = @"user";
NSString *const kResponseArtWorkArtWorkDesc = @"artWorkDesc";
NSString *const kResponseArtWorkSelfInclude = @"selfInclude";
NSString *const kResponseArtWorkLike = @"like";
NSString *const kResponseArtWorkReserveMinuteSet = @"reserveMinuteSet";
NSString *const kResponseArtWorkIsActive = @"isActive";
NSString *const kResponseArtWorkCuCount = @"cuCount";
NSString *const kResponseArtWorkHitCount = @"hitCount";
NSString *const kResponseArtWorkHasCeleb = @"hasCeleb";
NSString *const kResponseArtWorkCreateDate = @"createDate";
NSString *const kResponseArtWorkCuTitle = @"cuTitle";
NSString *const kResponseArtWorkArtWorkThumb = @"artWorkThumb";
NSString *const kResponseArtWorkArtWorkOpenDate = @"artWorkOpenDate";
NSString *const kResponseArtWorkReserveSet = @"reserveSet";
NSString *const kResponseArtWorkArtWorkAttache = @"artWorkAttache";
NSString *const kResponseArtWorkArtWorkIdx = @"artWorkIdx";
NSString *const kResponseArtWorkArtWorkHashTag = @"artWorkHashTag";


@interface ResponseArtWork ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResponseArtWork

@synthesize likeCount = _likeCount;
@synthesize cuNickName = _cuNickName;
@synthesize artworkShareUrl = _artworkShareUrl;
@synthesize locale = _locale;
@synthesize artWorkMovie = _artWorkMovie;
@synthesize artWorkTitle = _artWorkTitle;
@synthesize lang = _lang;
@synthesize artWorkListImage = _artWorkListImage;
@synthesize isActiveAdmin = _isActiveAdmin;
@synthesize isContest = _isContest;
@synthesize thumb = _thumb;
@synthesize artWorkType = _artWorkType;
@synthesize reserveDateSet = _reserveDateSet;
@synthesize reserveHourSet = _reserveHourSet;
@synthesize commentCount = _commentCount;
@synthesize selfInspection = _selfInspection;
@synthesize hasBadge = _hasBadge;
@synthesize artWorkKind = _artWorkKind;
@synthesize following = _following;
@synthesize user = _user;
@synthesize artWorkDesc = _artWorkDesc;
@synthesize selfInclude = _selfInclude;
@synthesize like = _like;
@synthesize reserveMinuteSet = _reserveMinuteSet;
@synthesize isActive = _isActive;
@synthesize cuCount = _cuCount;
@synthesize hitCount = _hitCount;
@synthesize hasCeleb = _hasCeleb;
@synthesize createDate = _createDate;
@synthesize cuTitle = _cuTitle;
@synthesize artWorkThumb = _artWorkThumb;
@synthesize artWorkOpenDate = _artWorkOpenDate;
@synthesize reserveSet = _reserveSet;
@synthesize artWorkAttache = _artWorkAttache;
@synthesize artWorkIdx = _artWorkIdx;
@synthesize artWorkHashTag = _artWorkHashTag;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.likeCount = [[self objectOrNilForKey:kResponseArtWorkLikeCount fromDictionary:dict] doubleValue];
            self.cuNickName = [self objectOrNilForKey:kResponseArtWorkCuNickName fromDictionary:dict];
            self.artworkShareUrl = [self objectOrNilForKey:kResponseArtWorkArtworkShareUrl fromDictionary:dict];
            self.locale = [self objectOrNilForKey:kResponseArtWorkLocale fromDictionary:dict];
            self.artWorkMovie = [self objectOrNilForKey:kResponseArtWorkArtWorkMovie fromDictionary:dict];
            self.artWorkTitle = [self objectOrNilForKey:kResponseArtWorkArtWorkTitle fromDictionary:dict];
            self.lang = [self objectOrNilForKey:kResponseArtWorkLang fromDictionary:dict];
            self.artWorkListImage = [self objectOrNilForKey:kResponseArtWorkArtWorkListImage fromDictionary:dict];
            self.isActiveAdmin = [[self objectOrNilForKey:kResponseArtWorkIsActiveAdmin fromDictionary:dict] doubleValue];
            self.isContest = [[self objectOrNilForKey:kResponseArtWorkIsContest fromDictionary:dict] doubleValue];
            self.thumb = [Thumb modelObjectWithDictionary:[dict objectForKey:kResponseArtWorkThumb]];
            self.artWorkType = [[self objectOrNilForKey:kResponseArtWorkArtWorkType fromDictionary:dict] doubleValue];
            self.reserveDateSet = [self objectOrNilForKey:kResponseArtWorkReserveDateSet fromDictionary:dict];
            self.reserveHourSet = [self objectOrNilForKey:kResponseArtWorkReserveHourSet fromDictionary:dict];
            self.commentCount = [[self objectOrNilForKey:kResponseArtWorkCommentCount fromDictionary:dict] doubleValue];
            self.selfInspection = [self objectOrNilForKey:kResponseArtWorkSelfInspection fromDictionary:dict];
            self.hasBadge = [[self objectOrNilForKey:kResponseArtWorkHasBadge fromDictionary:dict] boolValue];
            self.artWorkKind = [[self objectOrNilForKey:kResponseArtWorkArtWorkKind fromDictionary:dict] doubleValue];
            self.following = [[self objectOrNilForKey:kResponseArtWorkFollowing fromDictionary:dict] boolValue];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kResponseArtWorkUser]];
            self.artWorkDesc = [self objectOrNilForKey:kResponseArtWorkArtWorkDesc fromDictionary:dict];
            self.selfInclude = [self objectOrNilForKey:kResponseArtWorkSelfInclude fromDictionary:dict];
            self.like = [[self objectOrNilForKey:kResponseArtWorkLike fromDictionary:dict] boolValue];
            self.reserveMinuteSet = [self objectOrNilForKey:kResponseArtWorkReserveMinuteSet fromDictionary:dict];
            self.isActive = [[self objectOrNilForKey:kResponseArtWorkIsActive fromDictionary:dict] doubleValue];
            self.cuCount = [[self objectOrNilForKey:kResponseArtWorkCuCount fromDictionary:dict] doubleValue];
            self.hitCount = [[self objectOrNilForKey:kResponseArtWorkHitCount fromDictionary:dict] doubleValue];
            self.hasCeleb = [[self objectOrNilForKey:kResponseArtWorkHasCeleb fromDictionary:dict] boolValue];
            self.createDate = [[self objectOrNilForKey:kResponseArtWorkCreateDate fromDictionary:dict] doubleValue];
            self.cuTitle = [self objectOrNilForKey:kResponseArtWorkCuTitle fromDictionary:dict];
            self.artWorkThumb = [self objectOrNilForKey:kResponseArtWorkArtWorkThumb fromDictionary:dict];
            self.artWorkOpenDate = [[self objectOrNilForKey:kResponseArtWorkArtWorkOpenDate fromDictionary:dict] doubleValue];
            self.reserveSet = [[self objectOrNilForKey:kResponseArtWorkReserveSet fromDictionary:dict] boolValue];
            self.artWorkAttache = [self objectOrNilForKey:kResponseArtWorkArtWorkAttache fromDictionary:dict];
            self.artWorkIdx = [[self objectOrNilForKey:kResponseArtWorkArtWorkIdx fromDictionary:dict] doubleValue];
            self.artWorkHashTag = [self objectOrNilForKey:kResponseArtWorkArtWorkHashTag fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kResponseArtWorkLikeCount];
    [mutableDict setValue:self.cuNickName forKey:kResponseArtWorkCuNickName];
    [mutableDict setValue:self.artworkShareUrl forKey:kResponseArtWorkArtworkShareUrl];
    [mutableDict setValue:self.locale forKey:kResponseArtWorkLocale];
    [mutableDict setValue:self.artWorkMovie forKey:kResponseArtWorkArtWorkMovie];
    [mutableDict setValue:self.artWorkTitle forKey:kResponseArtWorkArtWorkTitle];
    [mutableDict setValue:self.lang forKey:kResponseArtWorkLang];
    [mutableDict setValue:self.artWorkListImage forKey:kResponseArtWorkArtWorkListImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isActiveAdmin] forKey:kResponseArtWorkIsActiveAdmin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isContest] forKey:kResponseArtWorkIsContest];
    [mutableDict setValue:[self.thumb dictionaryRepresentation] forKey:kResponseArtWorkThumb];
    [mutableDict setValue:[NSNumber numberWithDouble:self.artWorkType] forKey:kResponseArtWorkArtWorkType];
    [mutableDict setValue:self.reserveDateSet forKey:kResponseArtWorkReserveDateSet];
    [mutableDict setValue:self.reserveHourSet forKey:kResponseArtWorkReserveHourSet];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kResponseArtWorkCommentCount];
    [mutableDict setValue:self.selfInspection forKey:kResponseArtWorkSelfInspection];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasBadge] forKey:kResponseArtWorkHasBadge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.artWorkKind] forKey:kResponseArtWorkArtWorkKind];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kResponseArtWorkFollowing];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kResponseArtWorkUser];
    [mutableDict setValue:self.artWorkDesc forKey:kResponseArtWorkArtWorkDesc];
    [mutableDict setValue:self.selfInclude forKey:kResponseArtWorkSelfInclude];
    [mutableDict setValue:[NSNumber numberWithBool:self.like] forKey:kResponseArtWorkLike];
    [mutableDict setValue:self.reserveMinuteSet forKey:kResponseArtWorkReserveMinuteSet];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isActive] forKey:kResponseArtWorkIsActive];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cuCount] forKey:kResponseArtWorkCuCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hitCount] forKey:kResponseArtWorkHitCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasCeleb] forKey:kResponseArtWorkHasCeleb];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createDate] forKey:kResponseArtWorkCreateDate];
    [mutableDict setValue:self.cuTitle forKey:kResponseArtWorkCuTitle];
    [mutableDict setValue:self.artWorkThumb forKey:kResponseArtWorkArtWorkThumb];
    [mutableDict setValue:[NSNumber numberWithDouble:self.artWorkOpenDate] forKey:kResponseArtWorkArtWorkOpenDate];
    [mutableDict setValue:[NSNumber numberWithBool:self.reserveSet] forKey:kResponseArtWorkReserveSet];
    [mutableDict setValue:self.artWorkAttache forKey:kResponseArtWorkArtWorkAttache];
    [mutableDict setValue:[NSNumber numberWithDouble:self.artWorkIdx] forKey:kResponseArtWorkArtWorkIdx];
    [mutableDict setValue:self.artWorkHashTag forKey:kResponseArtWorkArtWorkHashTag];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.likeCount = [aDecoder decodeDoubleForKey:kResponseArtWorkLikeCount];
    self.cuNickName = [aDecoder decodeObjectForKey:kResponseArtWorkCuNickName];
    self.artworkShareUrl = [aDecoder decodeObjectForKey:kResponseArtWorkArtworkShareUrl];
    self.locale = [aDecoder decodeObjectForKey:kResponseArtWorkLocale];
    self.artWorkMovie = [aDecoder decodeObjectForKey:kResponseArtWorkArtWorkMovie];
    self.artWorkTitle = [aDecoder decodeObjectForKey:kResponseArtWorkArtWorkTitle];
    self.lang = [aDecoder decodeObjectForKey:kResponseArtWorkLang];
    self.artWorkListImage = [aDecoder decodeObjectForKey:kResponseArtWorkArtWorkListImage];
    self.isActiveAdmin = [aDecoder decodeDoubleForKey:kResponseArtWorkIsActiveAdmin];
    self.isContest = [aDecoder decodeDoubleForKey:kResponseArtWorkIsContest];
    self.thumb = [aDecoder decodeObjectForKey:kResponseArtWorkThumb];
    self.artWorkType = [aDecoder decodeDoubleForKey:kResponseArtWorkArtWorkType];
    self.reserveDateSet = [aDecoder decodeObjectForKey:kResponseArtWorkReserveDateSet];
    self.reserveHourSet = [aDecoder decodeObjectForKey:kResponseArtWorkReserveHourSet];
    self.commentCount = [aDecoder decodeDoubleForKey:kResponseArtWorkCommentCount];
    self.selfInspection = [aDecoder decodeObjectForKey:kResponseArtWorkSelfInspection];
    self.hasBadge = [aDecoder decodeBoolForKey:kResponseArtWorkHasBadge];
    self.artWorkKind = [aDecoder decodeDoubleForKey:kResponseArtWorkArtWorkKind];
    self.following = [aDecoder decodeBoolForKey:kResponseArtWorkFollowing];
    self.user = [aDecoder decodeObjectForKey:kResponseArtWorkUser];
    self.artWorkDesc = [aDecoder decodeObjectForKey:kResponseArtWorkArtWorkDesc];
    self.selfInclude = [aDecoder decodeObjectForKey:kResponseArtWorkSelfInclude];
    self.like = [aDecoder decodeBoolForKey:kResponseArtWorkLike];
    self.reserveMinuteSet = [aDecoder decodeObjectForKey:kResponseArtWorkReserveMinuteSet];
    self.isActive = [aDecoder decodeDoubleForKey:kResponseArtWorkIsActive];
    self.cuCount = [aDecoder decodeDoubleForKey:kResponseArtWorkCuCount];
    self.hitCount = [aDecoder decodeDoubleForKey:kResponseArtWorkHitCount];
    self.hasCeleb = [aDecoder decodeBoolForKey:kResponseArtWorkHasCeleb];
    self.createDate = [aDecoder decodeDoubleForKey:kResponseArtWorkCreateDate];
    self.cuTitle = [aDecoder decodeObjectForKey:kResponseArtWorkCuTitle];
    self.artWorkThumb = [aDecoder decodeObjectForKey:kResponseArtWorkArtWorkThumb];
    self.artWorkOpenDate = [aDecoder decodeDoubleForKey:kResponseArtWorkArtWorkOpenDate];
    self.reserveSet = [aDecoder decodeBoolForKey:kResponseArtWorkReserveSet];
    self.artWorkAttache = [aDecoder decodeObjectForKey:kResponseArtWorkArtWorkAttache];
    self.artWorkIdx = [aDecoder decodeDoubleForKey:kResponseArtWorkArtWorkIdx];
    self.artWorkHashTag = [aDecoder decodeObjectForKey:kResponseArtWorkArtWorkHashTag];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_likeCount forKey:kResponseArtWorkLikeCount];
    [aCoder encodeObject:_cuNickName forKey:kResponseArtWorkCuNickName];
    [aCoder encodeObject:_artworkShareUrl forKey:kResponseArtWorkArtworkShareUrl];
    [aCoder encodeObject:_locale forKey:kResponseArtWorkLocale];
    [aCoder encodeObject:_artWorkMovie forKey:kResponseArtWorkArtWorkMovie];
    [aCoder encodeObject:_artWorkTitle forKey:kResponseArtWorkArtWorkTitle];
    [aCoder encodeObject:_lang forKey:kResponseArtWorkLang];
    [aCoder encodeObject:_artWorkListImage forKey:kResponseArtWorkArtWorkListImage];
    [aCoder encodeDouble:_isActiveAdmin forKey:kResponseArtWorkIsActiveAdmin];
    [aCoder encodeDouble:_isContest forKey:kResponseArtWorkIsContest];
    [aCoder encodeObject:_thumb forKey:kResponseArtWorkThumb];
    [aCoder encodeDouble:_artWorkType forKey:kResponseArtWorkArtWorkType];
    [aCoder encodeObject:_reserveDateSet forKey:kResponseArtWorkReserveDateSet];
    [aCoder encodeObject:_reserveHourSet forKey:kResponseArtWorkReserveHourSet];
    [aCoder encodeDouble:_commentCount forKey:kResponseArtWorkCommentCount];
    [aCoder encodeObject:_selfInspection forKey:kResponseArtWorkSelfInspection];
    [aCoder encodeBool:_hasBadge forKey:kResponseArtWorkHasBadge];
    [aCoder encodeDouble:_artWorkKind forKey:kResponseArtWorkArtWorkKind];
    [aCoder encodeBool:_following forKey:kResponseArtWorkFollowing];
    [aCoder encodeObject:_user forKey:kResponseArtWorkUser];
    [aCoder encodeObject:_artWorkDesc forKey:kResponseArtWorkArtWorkDesc];
    [aCoder encodeObject:_selfInclude forKey:kResponseArtWorkSelfInclude];
    [aCoder encodeBool:_like forKey:kResponseArtWorkLike];
    [aCoder encodeObject:_reserveMinuteSet forKey:kResponseArtWorkReserveMinuteSet];
    [aCoder encodeDouble:_isActive forKey:kResponseArtWorkIsActive];
    [aCoder encodeDouble:_cuCount forKey:kResponseArtWorkCuCount];
    [aCoder encodeDouble:_hitCount forKey:kResponseArtWorkHitCount];
    [aCoder encodeBool:_hasCeleb forKey:kResponseArtWorkHasCeleb];
    [aCoder encodeDouble:_createDate forKey:kResponseArtWorkCreateDate];
    [aCoder encodeObject:_cuTitle forKey:kResponseArtWorkCuTitle];
    [aCoder encodeObject:_artWorkThumb forKey:kResponseArtWorkArtWorkThumb];
    [aCoder encodeDouble:_artWorkOpenDate forKey:kResponseArtWorkArtWorkOpenDate];
    [aCoder encodeBool:_reserveSet forKey:kResponseArtWorkReserveSet];
    [aCoder encodeObject:_artWorkAttache forKey:kResponseArtWorkArtWorkAttache];
    [aCoder encodeDouble:_artWorkIdx forKey:kResponseArtWorkArtWorkIdx];
    [aCoder encodeObject:_artWorkHashTag forKey:kResponseArtWorkArtWorkHashTag];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResponseArtWork *copy = [[ResponseArtWork alloc] init];
    
    if (copy) {

        copy.likeCount = self.likeCount;
        copy.cuNickName = [self.cuNickName copyWithZone:zone];
        copy.artworkShareUrl = [self.artworkShareUrl copyWithZone:zone];
        copy.locale = [self.locale copyWithZone:zone];
        copy.artWorkMovie = [self.artWorkMovie copyWithZone:zone];
        copy.artWorkTitle = [self.artWorkTitle copyWithZone:zone];
        copy.lang = [self.lang copyWithZone:zone];
        copy.artWorkListImage = [self.artWorkListImage copyWithZone:zone];
        copy.isActiveAdmin = self.isActiveAdmin;
        copy.isContest = self.isContest;
        copy.thumb = [self.thumb copyWithZone:zone];
        copy.artWorkType = self.artWorkType;
        copy.reserveDateSet = [self.reserveDateSet copyWithZone:zone];
        copy.reserveHourSet = [self.reserveHourSet copyWithZone:zone];
        copy.commentCount = self.commentCount;
        copy.selfInspection = [self.selfInspection copyWithZone:zone];
        copy.hasBadge = self.hasBadge;
        copy.artWorkKind = self.artWorkKind;
        copy.following = self.following;
        copy.user = [self.user copyWithZone:zone];
        copy.artWorkDesc = [self.artWorkDesc copyWithZone:zone];
        copy.selfInclude = [self.selfInclude copyWithZone:zone];
        copy.like = self.like;
        copy.reserveMinuteSet = [self.reserveMinuteSet copyWithZone:zone];
        copy.isActive = self.isActive;
        copy.cuCount = self.cuCount;
        copy.hitCount = self.hitCount;
        copy.hasCeleb = self.hasCeleb;
        copy.createDate = self.createDate;
        copy.cuTitle = [self.cuTitle copyWithZone:zone];
        copy.artWorkThumb = [self.artWorkThumb copyWithZone:zone];
        copy.artWorkOpenDate = self.artWorkOpenDate;
        copy.reserveSet = self.reserveSet;
        copy.artWorkAttache = [self.artWorkAttache copyWithZone:zone];
        copy.artWorkIdx = self.artWorkIdx;
        copy.artWorkHashTag = [self.artWorkHashTag copyWithZone:zone];
    }
    
    return copy;
}


@end
