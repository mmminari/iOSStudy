//
//  Album+TableRepresentation.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "Album+TableRepresentation.h"

@implementation Album (TableRepresentation)


- (NSDictionary *)tr_tableRepresentation
{
    return @{@"titles":@[@"Artist", @"Album", @"Genre", @"Year"],
             @"values":@[self.artist, self.title, self.genre, self.year]};
}

@end
