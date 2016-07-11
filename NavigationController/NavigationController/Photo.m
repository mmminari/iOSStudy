//
//  Photo.m
//
//  Created by   on 2016. 7. 11.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Photo.h"


NSString *const kPhotoSecret = @"secret";
NSString *const kPhotoId = @"id";
NSString *const kPhotoIsfamily = @"isfamily";
NSString *const kPhotoIspublic = @"ispublic";
NSString *const kPhotoFarm = @"farm";
NSString *const kPhotoOwner = @"owner";
NSString *const kPhotoServer = @"server";
NSString *const kPhotoUrlM = @"url_m";
NSString *const kPhotoTitle = @"title";
NSString *const kPhotoIsfriend = @"isfriend";
NSString *const kPhotoHeightM = @"height_m";
NSString *const kPhotoWidthM = @"width_m";


@interface Photo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Photo

@synthesize secret = _secret;
@synthesize photoIdentifier = _photoIdentifier;
@synthesize isfamily = _isfamily;
@synthesize ispublic = _ispublic;
@synthesize farm = _farm;
@synthesize owner = _owner;
@synthesize server = _server;
@synthesize urlM = _urlM;
@synthesize title = _title;
@synthesize isfriend = _isfriend;
@synthesize heightM = _heightM;
@synthesize widthM = _widthM;


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
            self.secret = [self objectOrNilForKey:kPhotoSecret fromDictionary:dict];
            self.photoIdentifier = [self objectOrNilForKey:kPhotoId fromDictionary:dict];
            self.isfamily = [[self objectOrNilForKey:kPhotoIsfamily fromDictionary:dict] doubleValue];
            self.ispublic = [[self objectOrNilForKey:kPhotoIspublic fromDictionary:dict] doubleValue];
            self.farm = [[self objectOrNilForKey:kPhotoFarm fromDictionary:dict] doubleValue];
            self.owner = [self objectOrNilForKey:kPhotoOwner fromDictionary:dict];
            self.server = [self objectOrNilForKey:kPhotoServer fromDictionary:dict];
            self.urlM = [self objectOrNilForKey:kPhotoUrlM fromDictionary:dict];
            self.title = [self objectOrNilForKey:kPhotoTitle fromDictionary:dict];
            self.isfriend = [[self objectOrNilForKey:kPhotoIsfriend fromDictionary:dict] doubleValue];
            self.heightM = [self objectOrNilForKey:kPhotoHeightM fromDictionary:dict];
            self.widthM = [self objectOrNilForKey:kPhotoWidthM fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.secret forKey:kPhotoSecret];
    [mutableDict setValue:self.photoIdentifier forKey:kPhotoId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isfamily] forKey:kPhotoIsfamily];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ispublic] forKey:kPhotoIspublic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.farm] forKey:kPhotoFarm];
    [mutableDict setValue:self.owner forKey:kPhotoOwner];
    [mutableDict setValue:self.server forKey:kPhotoServer];
    [mutableDict setValue:self.urlM forKey:kPhotoUrlM];
    [mutableDict setValue:self.title forKey:kPhotoTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isfriend] forKey:kPhotoIsfriend];
    [mutableDict setValue:self.heightM forKey:kPhotoHeightM];
    [mutableDict setValue:self.widthM forKey:kPhotoWidthM];

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

    self.secret = [aDecoder decodeObjectForKey:kPhotoSecret];
    self.photoIdentifier = [aDecoder decodeObjectForKey:kPhotoId];
    self.isfamily = [aDecoder decodeDoubleForKey:kPhotoIsfamily];
    self.ispublic = [aDecoder decodeDoubleForKey:kPhotoIspublic];
    self.farm = [aDecoder decodeDoubleForKey:kPhotoFarm];
    self.owner = [aDecoder decodeObjectForKey:kPhotoOwner];
    self.server = [aDecoder decodeObjectForKey:kPhotoServer];
    self.urlM = [aDecoder decodeObjectForKey:kPhotoUrlM];
    self.title = [aDecoder decodeObjectForKey:kPhotoTitle];
    self.isfriend = [aDecoder decodeDoubleForKey:kPhotoIsfriend];
    self.heightM = [aDecoder decodeObjectForKey:kPhotoHeightM];
    self.widthM = [aDecoder decodeObjectForKey:kPhotoWidthM];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_secret forKey:kPhotoSecret];
    [aCoder encodeObject:_photoIdentifier forKey:kPhotoId];
    [aCoder encodeDouble:_isfamily forKey:kPhotoIsfamily];
    [aCoder encodeDouble:_ispublic forKey:kPhotoIspublic];
    [aCoder encodeDouble:_farm forKey:kPhotoFarm];
    [aCoder encodeObject:_owner forKey:kPhotoOwner];
    [aCoder encodeObject:_server forKey:kPhotoServer];
    [aCoder encodeObject:_urlM forKey:kPhotoUrlM];
    [aCoder encodeObject:_title forKey:kPhotoTitle];
    [aCoder encodeDouble:_isfriend forKey:kPhotoIsfriend];
    [aCoder encodeObject:_heightM forKey:kPhotoHeightM];
    [aCoder encodeObject:_widthM forKey:kPhotoWidthM];
}

- (id)copyWithZone:(NSZone *)zone
{
    Photo *copy = [[Photo alloc] init];
    
    if (copy) {

        copy.secret = [self.secret copyWithZone:zone];
        copy.photoIdentifier = [self.photoIdentifier copyWithZone:zone];
        copy.isfamily = self.isfamily;
        copy.ispublic = self.ispublic;
        copy.farm = self.farm;
        copy.owner = [self.owner copyWithZone:zone];
        copy.server = [self.server copyWithZone:zone];
        copy.urlM = [self.urlM copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.isfriend = self.isfriend;
        copy.heightM = [self.heightM copyWithZone:zone];
        copy.widthM = [self.widthM copyWithZone:zone];
    }
    
    return copy;
}


@end
