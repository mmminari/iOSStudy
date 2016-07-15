//
//  Photo.h
//
//  Created by   on 2016. 7. 12.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *photoIdentifier;
@property (nonatomic, assign) double isfamily;
@property (nonatomic, assign) double ispublic;
@property (nonatomic, assign) double farm;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *server;
@property (nonatomic, strong) NSString *urlM;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double isfriend;
@property (nonatomic, strong) NSString *heightM;
@property (nonatomic, strong) NSString *widthM;
@property (nonatomic, strong) UIImage *localPhoto;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
