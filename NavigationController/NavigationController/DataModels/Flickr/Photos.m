//
//  Photos.m
//
//  Created by   on 2016. 7. 12.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Photos.h"
#import "Photo.h"


NSString *const kPhotosPhoto = @"photo";
NSString *const kPhotosPages = @"pages";
NSString *const kPhotosPerpage = @"perpage";
NSString *const kPhotosTotal = @"total";
NSString *const kPhotosPage = @"page";


@interface Photos ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Photos

@synthesize photo = _photo;
@synthesize pages = _pages;
@synthesize perpage = _perpage;
@synthesize total = _total;
@synthesize page = _page;


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
    NSObject *receivedPhoto = [dict objectForKey:kPhotosPhoto];
    NSMutableArray *parsedPhoto = [NSMutableArray array];
    if ([receivedPhoto isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPhoto) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPhoto addObject:[Photo modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPhoto isKindOfClass:[NSDictionary class]]) {
       [parsedPhoto addObject:[Photo modelObjectWithDictionary:(NSDictionary *)receivedPhoto]];
    }

    self.photo = [NSArray arrayWithArray:parsedPhoto];
            self.pages = [[self objectOrNilForKey:kPhotosPages fromDictionary:dict] doubleValue];
            self.perpage = [[self objectOrNilForKey:kPhotosPerpage fromDictionary:dict] doubleValue];
            self.total = [[self objectOrNilForKey:kPhotosTotal fromDictionary:dict] doubleValue];
            self.page = [[self objectOrNilForKey:kPhotosPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForPhoto = [NSMutableArray array];
    for (NSObject *subArrayObject in self.photo) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPhoto addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPhoto addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPhoto] forKey:kPhotosPhoto];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kPhotosPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.perpage] forKey:kPhotosPerpage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kPhotosTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kPhotosPage];

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

    self.photo = [aDecoder decodeObjectForKey:kPhotosPhoto];
    self.pages = [aDecoder decodeDoubleForKey:kPhotosPages];
    self.perpage = [aDecoder decodeDoubleForKey:kPhotosPerpage];
    self.total = [aDecoder decodeDoubleForKey:kPhotosTotal];
    self.page = [aDecoder decodeDoubleForKey:kPhotosPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_photo forKey:kPhotosPhoto];
    [aCoder encodeDouble:_pages forKey:kPhotosPages];
    [aCoder encodeDouble:_perpage forKey:kPhotosPerpage];
    [aCoder encodeDouble:_total forKey:kPhotosTotal];
    [aCoder encodeDouble:_page forKey:kPhotosPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    Photos *copy = [[Photos alloc] init];
    
    if (copy) {

        copy.photo = [self.photo copyWithZone:zone];
        copy.pages = self.pages;
        copy.perpage = self.perpage;
        copy.total = self.total;
        copy.page = self.page;
    }
    
    return copy;
}


@end
