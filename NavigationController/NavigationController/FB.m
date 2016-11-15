//
//  FB.m
//
//  Created by   on 2016. 11. 14.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FB.h"
#import "Data.h"


NSString *const kFBMessage = @"message";
NSString *const kFBData = @"data";
NSString *const kFBCode = @"code";


@interface FB ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FB

@synthesize message = _message;
@synthesize data = _data;
@synthesize code = _code;


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
            self.message = [self objectOrNilForKey:kFBMessage fromDictionary:dict];
            self.data = [Data modelObjectWithDictionary:[dict objectForKey:kFBData]];
            self.code = [[self objectOrNilForKey:kFBCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kFBMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kFBData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kFBCode];

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

    self.message = [aDecoder decodeObjectForKey:kFBMessage];
    self.data = [aDecoder decodeObjectForKey:kFBData];
    self.code = [aDecoder decodeDoubleForKey:kFBCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kFBMessage];
    [aCoder encodeObject:_data forKey:kFBData];
    [aCoder encodeDouble:_code forKey:kFBCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    FB *copy = [[FB alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
