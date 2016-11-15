//
//  User.m
//
//  Created by   on 2016. 11. 14.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "User.h"
#import "UserCountSummary.h"


NSString *const kUserUserIsActive = @"user_isActive";
NSString *const kUserFanbookUrl = @"fanbookUrl";
NSString *const kUserSkin = @"skin";
NSString *const kUserUserGender = @"userGender";
NSString *const kUserUserPhoto = @"userPhoto";
NSString *const kUserUserID = @"userID";
NSString *const kUserUserCountSummary = @"userCountSummary";
NSString *const kUserAuthorIcon = @"authorIcon";
NSString *const kUserAuthorRequest = @"authorRequest";
NSString *const kUserUserNameFirst = @"userNameFirst";
NSString *const kUserUserJoinType = @"userJoinType";
NSString *const kUserHasFollowing = @"hasFollowing";
NSString *const kUserSkinText = @"skinText";
NSString *const kUserUserShareUrl = @"userShareUrl";
NSString *const kUserUserLevel = @"userLevel";
NSString *const kUserUserIdx = @"userIdx";
NSString *const kUserArtWorkThumb = @"artWorkThumb";
NSString *const kUserUserNick = @"userNick";
NSString *const kUserUserJoinTypeName = @"userJoinTypeName";
NSString *const kUserUserTitle = @"userTitle";
NSString *const kUserUserCellPhoneCountryCode = @"userCellPhoneCountryCode";
NSString *const kUserUserName = @"userName";
NSString *const kUserUserCellPhone = @"userCellPhone";
NSString *const kUserUserUUID = @"userUUID";
NSString *const kUserUserSns = @"userSns";
NSString *const kUserIsFollowing = @"isFollowing";


@interface User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation User

@synthesize userIsActive = _userIsActive;
@synthesize fanbookUrl = _fanbookUrl;
@synthesize skin = _skin;
@synthesize userGender = _userGender;
@synthesize userPhoto = _userPhoto;
@synthesize userID = _userID;
@synthesize userCountSummary = _userCountSummary;
@synthesize authorIcon = _authorIcon;
@synthesize authorRequest = _authorRequest;
@synthesize userNameFirst = _userNameFirst;
@synthesize userJoinType = _userJoinType;
@synthesize hasFollowing = _hasFollowing;
@synthesize skinText = _skinText;
@synthesize userShareUrl = _userShareUrl;
@synthesize userLevel = _userLevel;
@synthesize userIdx = _userIdx;
@synthesize artWorkThumb = _artWorkThumb;
@synthesize userNick = _userNick;
@synthesize userJoinTypeName = _userJoinTypeName;
@synthesize userTitle = _userTitle;
@synthesize userCellPhoneCountryCode = _userCellPhoneCountryCode;
@synthesize userName = _userName;
@synthesize userCellPhone = _userCellPhone;
@synthesize userUUID = _userUUID;
@synthesize userSns = _userSns;
@synthesize isFollowing = _isFollowing;


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
            self.userIsActive = [self objectOrNilForKey:kUserUserIsActive fromDictionary:dict];
            self.fanbookUrl = [self objectOrNilForKey:kUserFanbookUrl fromDictionary:dict];
            self.skin = [self objectOrNilForKey:kUserSkin fromDictionary:dict];
            self.userGender = [self objectOrNilForKey:kUserUserGender fromDictionary:dict];
            self.userPhoto = [self objectOrNilForKey:kUserUserPhoto fromDictionary:dict];
            self.userID = [self objectOrNilForKey:kUserUserID fromDictionary:dict];
            self.userCountSummary = [UserCountSummary modelObjectWithDictionary:[dict objectForKey:kUserUserCountSummary]];
            self.authorIcon = [[self objectOrNilForKey:kUserAuthorIcon fromDictionary:dict] doubleValue];
            self.authorRequest = [[self objectOrNilForKey:kUserAuthorRequest fromDictionary:dict] doubleValue];
            self.userNameFirst = [self objectOrNilForKey:kUserUserNameFirst fromDictionary:dict];
            self.userJoinType = [self objectOrNilForKey:kUserUserJoinType fromDictionary:dict];
            self.hasFollowing = [[self objectOrNilForKey:kUserHasFollowing fromDictionary:dict] boolValue];
            self.skinText = [self objectOrNilForKey:kUserSkinText fromDictionary:dict];
            self.userShareUrl = [self objectOrNilForKey:kUserUserShareUrl fromDictionary:dict];
            self.userLevel = [self objectOrNilForKey:kUserUserLevel fromDictionary:dict];
            self.userIdx = [[self objectOrNilForKey:kUserUserIdx fromDictionary:dict] doubleValue];
            self.artWorkThumb = [self objectOrNilForKey:kUserArtWorkThumb fromDictionary:dict];
            self.userNick = [self objectOrNilForKey:kUserUserNick fromDictionary:dict];
            self.userJoinTypeName = [self objectOrNilForKey:kUserUserJoinTypeName fromDictionary:dict];
            self.userTitle = [self objectOrNilForKey:kUserUserTitle fromDictionary:dict];
            self.userCellPhoneCountryCode = [self objectOrNilForKey:kUserUserCellPhoneCountryCode fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kUserUserName fromDictionary:dict];
            self.userCellPhone = [self objectOrNilForKey:kUserUserCellPhone fromDictionary:dict];
            self.userUUID = [self objectOrNilForKey:kUserUserUUID fromDictionary:dict];
            self.userSns = [self objectOrNilForKey:kUserUserSns fromDictionary:dict];
            self.isFollowing = [[self objectOrNilForKey:kUserIsFollowing fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userIsActive forKey:kUserUserIsActive];
    [mutableDict setValue:self.fanbookUrl forKey:kUserFanbookUrl];
    [mutableDict setValue:self.skin forKey:kUserSkin];
    [mutableDict setValue:self.userGender forKey:kUserUserGender];
    [mutableDict setValue:self.userPhoto forKey:kUserUserPhoto];
    [mutableDict setValue:self.userID forKey:kUserUserID];
    [mutableDict setValue:[self.userCountSummary dictionaryRepresentation] forKey:kUserUserCountSummary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.authorIcon] forKey:kUserAuthorIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.authorRequest] forKey:kUserAuthorRequest];
    [mutableDict setValue:self.userNameFirst forKey:kUserUserNameFirst];
    [mutableDict setValue:self.userJoinType forKey:kUserUserJoinType];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasFollowing] forKey:kUserHasFollowing];
    [mutableDict setValue:self.skinText forKey:kUserSkinText];
    [mutableDict setValue:self.userShareUrl forKey:kUserUserShareUrl];
    [mutableDict setValue:self.userLevel forKey:kUserUserLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdx] forKey:kUserUserIdx];
    [mutableDict setValue:self.artWorkThumb forKey:kUserArtWorkThumb];
    [mutableDict setValue:self.userNick forKey:kUserUserNick];
    [mutableDict setValue:self.userJoinTypeName forKey:kUserUserJoinTypeName];
    [mutableDict setValue:self.userTitle forKey:kUserUserTitle];
    [mutableDict setValue:self.userCellPhoneCountryCode forKey:kUserUserCellPhoneCountryCode];
    [mutableDict setValue:self.userName forKey:kUserUserName];
    [mutableDict setValue:self.userCellPhone forKey:kUserUserCellPhone];
    [mutableDict setValue:self.userUUID forKey:kUserUserUUID];
    [mutableDict setValue:self.userSns forKey:kUserUserSns];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFollowing] forKey:kUserIsFollowing];

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

    self.userIsActive = [aDecoder decodeObjectForKey:kUserUserIsActive];
    self.fanbookUrl = [aDecoder decodeObjectForKey:kUserFanbookUrl];
    self.skin = [aDecoder decodeObjectForKey:kUserSkin];
    self.userGender = [aDecoder decodeObjectForKey:kUserUserGender];
    self.userPhoto = [aDecoder decodeObjectForKey:kUserUserPhoto];
    self.userID = [aDecoder decodeObjectForKey:kUserUserID];
    self.userCountSummary = [aDecoder decodeObjectForKey:kUserUserCountSummary];
    self.authorIcon = [aDecoder decodeDoubleForKey:kUserAuthorIcon];
    self.authorRequest = [aDecoder decodeDoubleForKey:kUserAuthorRequest];
    self.userNameFirst = [aDecoder decodeObjectForKey:kUserUserNameFirst];
    self.userJoinType = [aDecoder decodeObjectForKey:kUserUserJoinType];
    self.hasFollowing = [aDecoder decodeBoolForKey:kUserHasFollowing];
    self.skinText = [aDecoder decodeObjectForKey:kUserSkinText];
    self.userShareUrl = [aDecoder decodeObjectForKey:kUserUserShareUrl];
    self.userLevel = [aDecoder decodeObjectForKey:kUserUserLevel];
    self.userIdx = [aDecoder decodeDoubleForKey:kUserUserIdx];
    self.artWorkThumb = [aDecoder decodeObjectForKey:kUserArtWorkThumb];
    self.userNick = [aDecoder decodeObjectForKey:kUserUserNick];
    self.userJoinTypeName = [aDecoder decodeObjectForKey:kUserUserJoinTypeName];
    self.userTitle = [aDecoder decodeObjectForKey:kUserUserTitle];
    self.userCellPhoneCountryCode = [aDecoder decodeObjectForKey:kUserUserCellPhoneCountryCode];
    self.userName = [aDecoder decodeObjectForKey:kUserUserName];
    self.userCellPhone = [aDecoder decodeObjectForKey:kUserUserCellPhone];
    self.userUUID = [aDecoder decodeObjectForKey:kUserUserUUID];
    self.userSns = [aDecoder decodeObjectForKey:kUserUserSns];
    self.isFollowing = [aDecoder decodeBoolForKey:kUserIsFollowing];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userIsActive forKey:kUserUserIsActive];
    [aCoder encodeObject:_fanbookUrl forKey:kUserFanbookUrl];
    [aCoder encodeObject:_skin forKey:kUserSkin];
    [aCoder encodeObject:_userGender forKey:kUserUserGender];
    [aCoder encodeObject:_userPhoto forKey:kUserUserPhoto];
    [aCoder encodeObject:_userID forKey:kUserUserID];
    [aCoder encodeObject:_userCountSummary forKey:kUserUserCountSummary];
    [aCoder encodeDouble:_authorIcon forKey:kUserAuthorIcon];
    [aCoder encodeDouble:_authorRequest forKey:kUserAuthorRequest];
    [aCoder encodeObject:_userNameFirst forKey:kUserUserNameFirst];
    [aCoder encodeObject:_userJoinType forKey:kUserUserJoinType];
    [aCoder encodeBool:_hasFollowing forKey:kUserHasFollowing];
    [aCoder encodeObject:_skinText forKey:kUserSkinText];
    [aCoder encodeObject:_userShareUrl forKey:kUserUserShareUrl];
    [aCoder encodeObject:_userLevel forKey:kUserUserLevel];
    [aCoder encodeDouble:_userIdx forKey:kUserUserIdx];
    [aCoder encodeObject:_artWorkThumb forKey:kUserArtWorkThumb];
    [aCoder encodeObject:_userNick forKey:kUserUserNick];
    [aCoder encodeObject:_userJoinTypeName forKey:kUserUserJoinTypeName];
    [aCoder encodeObject:_userTitle forKey:kUserUserTitle];
    [aCoder encodeObject:_userCellPhoneCountryCode forKey:kUserUserCellPhoneCountryCode];
    [aCoder encodeObject:_userName forKey:kUserUserName];
    [aCoder encodeObject:_userCellPhone forKey:kUserUserCellPhone];
    [aCoder encodeObject:_userUUID forKey:kUserUserUUID];
    [aCoder encodeObject:_userSns forKey:kUserUserSns];
    [aCoder encodeBool:_isFollowing forKey:kUserIsFollowing];
}

- (id)copyWithZone:(NSZone *)zone
{
    User *copy = [[User alloc] init];
    
    if (copy) {

        copy.userIsActive = [self.userIsActive copyWithZone:zone];
        copy.fanbookUrl = [self.fanbookUrl copyWithZone:zone];
        copy.skin = [self.skin copyWithZone:zone];
        copy.userGender = [self.userGender copyWithZone:zone];
        copy.userPhoto = [self.userPhoto copyWithZone:zone];
        copy.userID = [self.userID copyWithZone:zone];
        copy.userCountSummary = [self.userCountSummary copyWithZone:zone];
        copy.authorIcon = self.authorIcon;
        copy.authorRequest = self.authorRequest;
        copy.userNameFirst = [self.userNameFirst copyWithZone:zone];
        copy.userJoinType = [self.userJoinType copyWithZone:zone];
        copy.hasFollowing = self.hasFollowing;
        copy.skinText = [self.skinText copyWithZone:zone];
        copy.userShareUrl = [self.userShareUrl copyWithZone:zone];
        copy.userLevel = [self.userLevel copyWithZone:zone];
        copy.userIdx = self.userIdx;
        copy.artWorkThumb = [self.artWorkThumb copyWithZone:zone];
        copy.userNick = [self.userNick copyWithZone:zone];
        copy.userJoinTypeName = [self.userJoinTypeName copyWithZone:zone];
        copy.userTitle = [self.userTitle copyWithZone:zone];
        copy.userCellPhoneCountryCode = [self.userCellPhoneCountryCode copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.userCellPhone = [self.userCellPhone copyWithZone:zone];
        copy.userUUID = [self.userUUID copyWithZone:zone];
        copy.userSns = [self.userSns copyWithZone:zone];
        copy.isFollowing = self.isFollowing;
    }
    
    return copy;
}


@end
