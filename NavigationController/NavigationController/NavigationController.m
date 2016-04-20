//
//  NavigationController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "NaviationController.h"

@interface NavigationController (UITableViewController)


@property (strong, nonatomic) NSMutableArray *listArr;



@end

@implementation NavigationController

-(void)viewDidLoad
{
    self.listArr = [[NSMutableArray alloc] initWithObjects:@"AttributedString", nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    return [self.listArr count];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *) tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"
                                                            forIndexPath:indexPath];
    return cell;
    
}

/*
 - (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if ([[segue identifier] isEqualToString:@"ToAttributedView"])
 {
 
 }
 }
 */



@end