//
//  Data.m
//
//  Created by   on 2016. 11. 14.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "ResponseArtWork.h"


NSString *const kDataTotalCount = @"totalCount";
NSString *const kDataResponseArtWork = @"ResponseArtWork";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize totalCount = _totalCount;
@synthesize responseArtWork = _responseArtWork;


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
            self.totalCount = [[self objectOrNilForKey:kDataTotalCount fromDictionary:dict] doubleValue];
    NSObject *receivedResponseArtWork = [dict objectForKey:kDataResponseArtWork];
    NSMutableArray *parsedResponseArtWork = [NSMutableArray array];
    if ([receivedResponseArtWork isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResponseArtWork) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResponseArtWork addObject:[ResponseArtWork modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResponseArtWork isKindOfClass:[NSDictionary class]]) {
       [parsedResponseArtWork addObject:[ResponseArtWork modelObjectWithDictionary:(NSDictionary *)receivedResponseArtWork]];
    }

    self.responseArtWork = [NSArray arrayWithArray:parsedResponseArtWork];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kDataTotalCount];
    NSMutableArray *tempArrayForResponseArtWork = [NSMutableArray array];
    for (NSObject *subArrayObject in self.responseArtWork) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResponseArtWork addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResponseArtWork addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResponseArtWork] forKey:kDataResponseArtWork];

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

    self.totalCount = [aDecoder decodeDoubleForKey:kDataTotalCount];
    self.responseArtWork = [aDecoder decodeObjectForKey:kDataResponseArtWork];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_totalCount forKey:kDataTotalCount];
    [aCoder encodeObject:_responseArtWork forKey:kDataResponseArtWork];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.totalCount = self.totalCount;
        copy.responseArtWork = [self.responseArtWork copyWithZone:zone];
    }
    
    return copy;
}


@end
