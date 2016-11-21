//
//  EpEpisodeModel.m
//
//  Created by   on 2016. 11. 21.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "EpEpisodeModel.h"
#import "EpList.h"


NSString *const kEpEpisodeModelResult = @"result";
NSString *const kEpEpisodeModelMessage = @"message";
NSString *const kEpEpisodeModelCode = @"code";
NSString *const kEpEpisodeModelNextOpenMonth = @"nextOpenMonth";
NSString *const kEpEpisodeModelMainEpisodeNo = @"mainEpisodeNo";
NSString *const kEpEpisodeModelList = @"list";


@interface EpEpisodeModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EpEpisodeModel

@synthesize result = _result;
@synthesize message = _message;
@synthesize code = _code;
@synthesize nextOpenMonth = _nextOpenMonth;
@synthesize mainEpisodeNo = _mainEpisodeNo;
@synthesize list = _list;


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
            self.result = [[self objectOrNilForKey:kEpEpisodeModelResult fromDictionary:dict] boolValue];
            self.message = [self objectOrNilForKey:kEpEpisodeModelMessage fromDictionary:dict];
            self.code = [self objectOrNilForKey:kEpEpisodeModelCode fromDictionary:dict];
            self.nextOpenMonth = [self objectOrNilForKey:kEpEpisodeModelNextOpenMonth fromDictionary:dict];
            self.mainEpisodeNo = [[self objectOrNilForKey:kEpEpisodeModelMainEpisodeNo fromDictionary:dict] doubleValue];
    NSObject *receivedEpList = [dict objectForKey:kEpEpisodeModelList];
    NSMutableArray *parsedEpList = [NSMutableArray array];
    if ([receivedEpList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedEpList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedEpList addObject:[EpList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedEpList isKindOfClass:[NSDictionary class]]) {
       [parsedEpList addObject:[EpList modelObjectWithDictionary:(NSDictionary *)receivedEpList]];
    }

    self.list = [NSArray arrayWithArray:parsedEpList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.result] forKey:kEpEpisodeModelResult];
    [mutableDict setValue:self.message forKey:kEpEpisodeModelMessage];
    [mutableDict setValue:self.code forKey:kEpEpisodeModelCode];
    [mutableDict setValue:self.nextOpenMonth forKey:kEpEpisodeModelNextOpenMonth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mainEpisodeNo] forKey:kEpEpisodeModelMainEpisodeNo];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kEpEpisodeModelList];

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

    self.result = [aDecoder decodeBoolForKey:kEpEpisodeModelResult];
    self.message = [aDecoder decodeObjectForKey:kEpEpisodeModelMessage];
    self.code = [aDecoder decodeObjectForKey:kEpEpisodeModelCode];
    self.nextOpenMonth = [aDecoder decodeObjectForKey:kEpEpisodeModelNextOpenMonth];
    self.mainEpisodeNo = [aDecoder decodeDoubleForKey:kEpEpisodeModelMainEpisodeNo];
    self.list = [aDecoder decodeObjectForKey:kEpEpisodeModelList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_result forKey:kEpEpisodeModelResult];
    [aCoder encodeObject:_message forKey:kEpEpisodeModelMessage];
    [aCoder encodeObject:_code forKey:kEpEpisodeModelCode];
    [aCoder encodeObject:_nextOpenMonth forKey:kEpEpisodeModelNextOpenMonth];
    [aCoder encodeDouble:_mainEpisodeNo forKey:kEpEpisodeModelMainEpisodeNo];
    [aCoder encodeObject:_list forKey:kEpEpisodeModelList];
}

- (id)copyWithZone:(NSZone *)zone
{
    EpEpisodeModel *copy = [[EpEpisodeModel alloc] init];
    
    if (copy) {

        copy.result = self.result;
        copy.message = [self.message copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.nextOpenMonth = [self.nextOpenMonth copyWithZone:zone];
        copy.mainEpisodeNo = self.mainEpisodeNo;
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
