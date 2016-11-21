//
//  EpList.m
//
//  Created by   on 2016. 11. 21.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "EpList.h"


NSString *const kEpListETitle = @"e_title";
NSString *const kEpListERegdate = @"e_regdate";
NSString *const kEpListEName = @"e_name";
NSString *const kEpListEMainImgUrl = @"e_main_img_url";
NSString *const kEpListESubTitle = @"e_sub_title";
NSString *const kEpListEIsmain = @"e_ismain";
NSString *const kEpListEDetailImgUrl = @"e_detail_img_url";
NSString *const kEpListEInfoMain = @"e_info_main";
NSString *const kEpListEInfoDetail = @"e_info_detail";
NSString *const kEpListEOrder = @"e_order";
NSString *const kEpListEIsopen = @"e_isopen";
NSString *const kEpListENumbering = @"e_numbering";
NSString *const kEpListEFile = @"e_file";
NSString *const kEpListENo = @"e_no";


@interface EpList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EpList

@synthesize eTitle = _eTitle;
@synthesize eRegdate = _eRegdate;
@synthesize eName = _eName;
@synthesize eMainImgUrl = _eMainImgUrl;
@synthesize eSubTitle = _eSubTitle;
@synthesize eIsmain = _eIsmain;
@synthesize eDetailImgUrl = _eDetailImgUrl;
@synthesize eInfoMain = _eInfoMain;
@synthesize eInfoDetail = _eInfoDetail;
@synthesize eOrder = _eOrder;
@synthesize eIsopen = _eIsopen;
@synthesize eNumbering = _eNumbering;
@synthesize eFile = _eFile;
@synthesize eNo = _eNo;


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
            self.eTitle = [self objectOrNilForKey:kEpListETitle fromDictionary:dict];
            self.eRegdate = [self objectOrNilForKey:kEpListERegdate fromDictionary:dict];
            self.eName = [self objectOrNilForKey:kEpListEName fromDictionary:dict];
            self.eMainImgUrl = [self objectOrNilForKey:kEpListEMainImgUrl fromDictionary:dict];
            self.eSubTitle = [self objectOrNilForKey:kEpListESubTitle fromDictionary:dict];
            self.eIsmain = [[self objectOrNilForKey:kEpListEIsmain fromDictionary:dict] boolValue];
            self.eDetailImgUrl = [self objectOrNilForKey:kEpListEDetailImgUrl fromDictionary:dict];
            self.eInfoMain = [self objectOrNilForKey:kEpListEInfoMain fromDictionary:dict];
            self.eInfoDetail = [self objectOrNilForKey:kEpListEInfoDetail fromDictionary:dict];
            self.eOrder = [[self objectOrNilForKey:kEpListEOrder fromDictionary:dict] doubleValue];
            self.eIsopen = [self objectOrNilForKey:kEpListEIsopen fromDictionary:dict];
            self.eNumbering = [self objectOrNilForKey:kEpListENumbering fromDictionary:dict];
            self.eFile = [self objectOrNilForKey:kEpListEFile fromDictionary:dict];
            self.eNo = [[self objectOrNilForKey:kEpListENo fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.eTitle forKey:kEpListETitle];
    [mutableDict setValue:self.eRegdate forKey:kEpListERegdate];
    [mutableDict setValue:self.eName forKey:kEpListEName];
    [mutableDict setValue:self.eMainImgUrl forKey:kEpListEMainImgUrl];
    [mutableDict setValue:self.eSubTitle forKey:kEpListESubTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.eIsmain] forKey:kEpListEIsmain];
    [mutableDict setValue:self.eDetailImgUrl forKey:kEpListEDetailImgUrl];
    [mutableDict setValue:self.eInfoMain forKey:kEpListEInfoMain];
    [mutableDict setValue:self.eInfoDetail forKey:kEpListEInfoDetail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eOrder] forKey:kEpListEOrder];
    [mutableDict setValue:self.eIsopen forKey:kEpListEIsopen];
    [mutableDict setValue:self.eNumbering forKey:kEpListENumbering];
    [mutableDict setValue:self.eFile forKey:kEpListEFile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eNo] forKey:kEpListENo];

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

    self.eTitle = [aDecoder decodeObjectForKey:kEpListETitle];
    self.eRegdate = [aDecoder decodeObjectForKey:kEpListERegdate];
    self.eName = [aDecoder decodeObjectForKey:kEpListEName];
    self.eMainImgUrl = [aDecoder decodeObjectForKey:kEpListEMainImgUrl];
    self.eSubTitle = [aDecoder decodeObjectForKey:kEpListESubTitle];
    self.eIsmain = [aDecoder decodeBoolForKey:kEpListEIsmain];
    self.eDetailImgUrl = [aDecoder decodeObjectForKey:kEpListEDetailImgUrl];
    self.eInfoMain = [aDecoder decodeObjectForKey:kEpListEInfoMain];
    self.eInfoDetail = [aDecoder decodeObjectForKey:kEpListEInfoDetail];
    self.eOrder = [aDecoder decodeDoubleForKey:kEpListEOrder];
    self.eIsopen = [aDecoder decodeObjectForKey:kEpListEIsopen];
    self.eNumbering = [aDecoder decodeObjectForKey:kEpListENumbering];
    self.eFile = [aDecoder decodeObjectForKey:kEpListEFile];
    self.eNo = [aDecoder decodeDoubleForKey:kEpListENo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_eTitle forKey:kEpListETitle];
    [aCoder encodeObject:_eRegdate forKey:kEpListERegdate];
    [aCoder encodeObject:_eName forKey:kEpListEName];
    [aCoder encodeObject:_eMainImgUrl forKey:kEpListEMainImgUrl];
    [aCoder encodeObject:_eSubTitle forKey:kEpListESubTitle];
    [aCoder encodeBool:_eIsmain forKey:kEpListEIsmain];
    [aCoder encodeObject:_eDetailImgUrl forKey:kEpListEDetailImgUrl];
    [aCoder encodeObject:_eInfoMain forKey:kEpListEInfoMain];
    [aCoder encodeObject:_eInfoDetail forKey:kEpListEInfoDetail];
    [aCoder encodeDouble:_eOrder forKey:kEpListEOrder];
    [aCoder encodeObject:_eIsopen forKey:kEpListEIsopen];
    [aCoder encodeObject:_eNumbering forKey:kEpListENumbering];
    [aCoder encodeObject:_eFile forKey:kEpListEFile];
    [aCoder encodeDouble:_eNo forKey:kEpListENo];
}

- (id)copyWithZone:(NSZone *)zone
{
    EpList *copy = [[EpList alloc] init];
    
    if (copy) {

        copy.eTitle = [self.eTitle copyWithZone:zone];
        copy.eRegdate = [self.eRegdate copyWithZone:zone];
        copy.eName = [self.eName copyWithZone:zone];
        copy.eMainImgUrl = [self.eMainImgUrl copyWithZone:zone];
        copy.eSubTitle = [self.eSubTitle copyWithZone:zone];
        copy.eIsmain = self.eIsmain;
        copy.eDetailImgUrl = [self.eDetailImgUrl copyWithZone:zone];
        copy.eInfoMain = [self.eInfoMain copyWithZone:zone];
        copy.eInfoDetail = [self.eInfoDetail copyWithZone:zone];
        copy.eOrder = self.eOrder;
        copy.eIsopen = [self.eIsopen copyWithZone:zone];
        copy.eNumbering = [self.eNumbering copyWithZone:zone];
        copy.eFile = [self.eFile copyWithZone:zone];
        copy.eNo = self.eNo;
    }
    
    return copy;
}


@end
