//
//  User.h
//
//  Created by   on 2016. 11. 14.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserCountSummary;

@interface User : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *userIsActive;
@property (nonatomic, strong) NSString *fanbookUrl;
@property (nonatomic, assign) id skin;
@property (nonatomic, strong) NSString *userGender;
@property (nonatomic, strong) NSString *userPhoto;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) UserCountSummary *userCountSummary;
@property (nonatomic, assign) double authorIcon;
@property (nonatomic, assign) double authorRequest;
@property (nonatomic, strong) NSString *userNameFirst;
@property (nonatomic, strong) NSString *userJoinType;
@property (nonatomic, assign) BOOL hasFollowing;
@property (nonatomic, assign) id skinText;
@property (nonatomic, strong) NSString *userShareUrl;
@property (nonatomic, strong) NSString *userLevel;
@property (nonatomic, assign) double userIdx;
@property (nonatomic, assign) id artWorkThumb;
@property (nonatomic, strong) NSString *userNick;
@property (nonatomic, strong) NSString *userJoinTypeName;
@property (nonatomic, assign) id userTitle;
@property (nonatomic, strong) NSString *userCellPhoneCountryCode;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userCellPhone;
@property (nonatomic, strong) NSString *userUUID;
@property (nonatomic, assign) id userSns;
@property (nonatomic, assign) BOOL isFollowing;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
