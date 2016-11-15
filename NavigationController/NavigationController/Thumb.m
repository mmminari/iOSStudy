//
//  Thumb.m
//
//  Created by   on 2016. 11. 14.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Thumb.h"


NSString *const kThumbIsMain = @"isMain";
NSString *const kThumbHeight = @"height";
NSString *const kThumbFileName = @"fileName";
NSString *const kThumbOrder = @"order";
NSString *const kThumbImageKey = @"imageKey";
NSString *const kThumbSize = @"size";
NSString *const kThumbWidth = @"width";
NSString *const kThumbThumbType = @"thumbType";
NSString *const kThumbDesc = @"desc";
NSString *const kThumbUrl = @"url";


@interface Thumb ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Thumb

@synthesize isMain = _isMain;
@synthesize height = _height;
@synthesize fileName = _fileName;
@synthesize order = _order;
@synthesize imageKey = _imageKey;
@synthesize size = _size;
@synthesize width = _width;
@synthesize thumbType = _thumbType;
@synthesize desc = _desc;
@synthesize url = _url;


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
            self.isMain = [[self objectOrNilForKey:kThumbIsMain fromDictionary:dict] boolValue];
            self.height = [self objectOrNilForKey:kThumbHeight fromDictionary:dict];
            self.fileName = [self objectOrNilForKey:kThumbFileName fromDictionary:dict];
            self.order = [self objectOrNilForKey:kThumbOrder fromDictionary:dict];
            self.imageKey = [self objectOrNilForKey:kThumbImageKey fromDictionary:dict];
            self.size = [self objectOrNilForKey:kThumbSize fromDictionary:dict];
            self.width = [self objectOrNilForKey:kThumbWidth fromDictionary:dict];
            self.thumbType = [self objectOrNilForKey:kThumbThumbType fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kThumbDesc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kThumbUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isMain] forKey:kThumbIsMain];
    [mutableDict setValue:self.height forKey:kThumbHeight];
    [mutableDict setValue:self.fileName forKey:kThumbFileName];
    [mutableDict setValue:self.order forKey:kThumbOrder];
    [mutableDict setValue:self.imageKey forKey:kThumbImageKey];
    [mutableDict setValue:self.size forKey:kThumbSize];
    [mutableDict setValue:self.width forKey:kThumbWidth];
    [mutableDict setValue:self.thumbType forKey:kThumbThumbType];
    [mutableDict setValue:self.desc forKey:kThumbDesc];
    [mutableDict setValue:self.url forKey:kThumbUrl];

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

    self.isMain = [aDecoder decodeBoolForKey:kThumbIsMain];
    self.height = [aDecoder decodeObjectForKey:kThumbHeight];
    self.fileName = [aDecoder decodeObjectForKey:kThumbFileName];
    self.order = [aDecoder decodeObjectForKey:kThumbOrder];
    self.imageKey = [aDecoder decodeObjectForKey:kThumbImageKey];
    self.size = [aDecoder decodeObjectForKey:kThumbSize];
    self.width = [aDecoder decodeObjectForKey:kThumbWidth];
    self.thumbType = [aDecoder decodeObjectForKey:kThumbThumbType];
    self.desc = [aDecoder decodeObjectForKey:kThumbDesc];
    self.url = [aDecoder decodeObjectForKey:kThumbUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isMain forKey:kThumbIsMain];
    [aCoder encodeObject:_height forKey:kThumbHeight];
    [aCoder encodeObject:_fileName forKey:kThumbFileName];
    [aCoder encodeObject:_order forKey:kThumbOrder];
    [aCoder encodeObject:_imageKey forKey:kThumbImageKey];
    [aCoder encodeObject:_size forKey:kThumbSize];
    [aCoder encodeObject:_width forKey:kThumbWidth];
    [aCoder encodeObject:_thumbType forKey:kThumbThumbType];
    [aCoder encodeObject:_desc forKey:kThumbDesc];
    [aCoder encodeObject:_url forKey:kThumbUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Thumb *copy = [[Thumb alloc] init];
    
    if (copy) {

        copy.isMain = self.isMain;
        copy.height = [self.height copyWithZone:zone];
        copy.fileName = [self.fileName copyWithZone:zone];
        copy.order = [self.order copyWithZone:zone];
        copy.imageKey = [self.imageKey copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.thumbType = [self.thumbType copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
