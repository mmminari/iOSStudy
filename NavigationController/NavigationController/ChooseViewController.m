//
//  ChooseViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 8..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ChooseViewController.h"
#import "RadioButtonViewController.h"

@interface ChooseViewController ()

@property (strong, nonatomic) NSArray *menuArr;
@property (assign, nonatomic) NSInteger selectedRow;

@end

@implementation ChooseViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.menuArr = @[@"단일선택", @"다중선택"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellId = @"radioMenuCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    }
    
    cell.textLabel.text = self.menuArr[indexPath.row];
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    self.selectedRow = indexPath.row;
    
    [self performSegueWithIdentifier:@"sgRadioMenuToRadio" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"sgRadioMenuToRadio"])
    {
        RadioButtonViewController *radioVC = [segue destinationViewController];
        if(self.selectedRow == 0)
        {
            radioVC.isSingleSelection = YES;
        }
        else
        {
            radioVC.isSingleSelection = NO;
        }
        
    }
}
@end
