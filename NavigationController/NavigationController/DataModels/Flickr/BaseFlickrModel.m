//
//  BaseFlickrModel.m
//
//  Created by   on 2016. 7. 12.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseFlickrModel.h"
#import "Photos.h"


NSString *const kBaseFlickrModelStat = @"stat";
NSString *const kBaseFlickrModelPhotos = @"photos";


@interface BaseFlickrModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseFlickrModel

@synthesize stat = _stat;
@synthesize photos = _photos;


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
            self.stat = [self objectOrNilForKey:kBaseFlickrModelStat fromDictionary:dict];
            self.photos = [Photos modelObjectWithDictionary:[dict objectForKey:kBaseFlickrModelPhotos]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.stat forKey:kBaseFlickrModelStat];
    [mutableDict setValue:[self.photos dictionaryRepresentation] forKey:kBaseFlickrModelPhotos];

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

    self.stat = [aDecoder decodeObjectForKey:kBaseFlickrModelStat];
    self.photos = [aDecoder decodeObjectForKey:kBaseFlickrModelPhotos];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_stat forKey:kBaseFlickrModelStat];
    [aCoder encodeObject:_photos forKey:kBaseFlickrModelPhotos];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseFlickrModel *copy = [[BaseFlickrModel alloc] init];
    
    if (copy) {

        copy.stat = [self.stat copyWithZone:zone];
        copy.photos = [self.photos copyWithZone:zone];
    }
    
    return copy;
}


@end
