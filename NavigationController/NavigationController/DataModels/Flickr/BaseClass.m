//
//  BaseClass.m
//
//  Created by   on 2016. 7. 11.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Photos.h"


NSString *const kBaseClassStat = @"stat";
NSString *const kBaseClassPhotos = @"photos";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

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
            self.stat = [self objectOrNilForKey:kBaseClassStat fromDictionary:dict];
            self.photos = [Photos modelObjectWithDictionary:[dict objectForKey:kBaseClassPhotos]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.stat forKey:kBaseClassStat];
    [mutableDict setValue:[self.photos dictionaryRepresentation] forKey:kBaseClassPhotos];

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

    self.stat = [aDecoder decodeObjectForKey:kBaseClassStat];
    self.photos = [aDecoder decodeObjectForKey:kBaseClassPhotos];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_stat forKey:kBaseClassStat];
    [aCoder encodeObject:_photos forKey:kBaseClassPhotos];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.stat = [self.stat copyWithZone:zone];
        copy.photos = [self.photos copyWithZone:zone];
    }
    
    return copy;
}


@end
