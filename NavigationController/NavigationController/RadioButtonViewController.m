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

@end

@implementation RadioButtonViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.listArr = @[@"aaaa", @"bbbbb", @"ccccc", @"ddddd", @"eeeee"];
    self.tvList.allowsMultipleSelection = NO;
    

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

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    RadioCell *cell = [self.tvList cellForRowAtIndexPath:indexPath];
    cell.ivIcon.highlighted =YES;

    LogYellow(@"indexNum : %zd, text : %@", indexPath.row, self.listArr[indexPath.row]);
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    RadioCell *cell = [self.tvList cellForRowAtIndexPath:indexPath];

    cell.ivIcon.highlighted = NO;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat height = 40.0f;
    
    return height;
}
@end
