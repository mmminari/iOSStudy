//
//  RadioButtonViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 8..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "RadioButtonViewController.h"
#import "RadioCell.h"

@interface RadioButtonViewController ()

@property (strong, nonatomic) NSArray *listArr;
@property (weak, nonatomic) IBOutlet UITableView *tvList;
@property (strong, nonatomic) NSMutableArray *selectedRows;
@property (assign, nonatomic) NSInteger selectedRow;

@end

@implementation RadioButtonViewController

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    self.listArr = @[@"aaaa", @"bbbbb", @"ccccc", @"ddddd", @"eeeee"];
    self.selectedRows = [NSMutableArray new];
    self.tvList.allowsMultipleSelection = !self.isSingleSelection;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellId = @"radioCell";
    RadioCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        cell = [[RadioCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }

    cell.lbTitle.text = self.listArr[indexPath.row];
    
    // cell.ivIcon.highlighted = (self.selectedRow == indexPath.row) ? YES : NO;
    //cell.ivIcon.highlighted = ([self.selectedRows containsObject:@(indexPath.row)]) ? YES : NO ;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    /*
    NSInteger countLimit = 0;
    
    if(self.isSingleSelection)
    {
        countLimit = 1;
    }

    if([self.selectedRows containsObject:@(indexPath.row)])
    {
        [self.selectedRows removeObject:@(indexPath.row)];
    }
    else
    {
        [self.selectedRows addObject:@(indexPath.row)];
    }
     
    self.tvList reloadData];

     */

    RadioCell *cell = [self.tvList cellForRowAtIndexPath:indexPath];

    if(cell.ivIcon.highlighted == YES)
    {
        cell.ivIcon.highlighted = NO;
    }
    else
    {
        cell.ivIcon.highlighted =YES;
    }

    LogYellow(@"indexNum : %zd, text : %@", indexPath.row, self.listArr[indexPath.row]);
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    RadioCell *cell = [self.tvList cellForRowAtIndexPath:indexPath];
    
    cell.ivIcon.highlighted = !self.isSingleSelection;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat height = 40.0f;
    
    return height;
}
@end
