//
//  EpList.h
//
//  Created by   on 2016. 11. 21.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface EpList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *eTitle;
@property (nonatomic, strong) NSString *eRegdate;
@property (nonatomic, strong) NSString *eName;
@property (nonatomic, strong) NSString *eMainImgUrl;
@property (nonatomic, assign) id eSubTitle;
@property (nonatomic, assign) BOOL eIsmain;
@property (nonatomic, strong) NSString *eDetailImgUrl;
@property (nonatomic, strong) NSString *eInfoMain;
@property (nonatomic, strong) NSString *eInfoDetail;
@property (nonatomic, assign) double eOrder;
@property (nonatomic, strong) NSString *eIsopen;
@property (nonatomic, strong) NSString *eNumbering;
@property (nonatomic, assign) id eFile;
@property (nonatomic, assign) double eNo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
