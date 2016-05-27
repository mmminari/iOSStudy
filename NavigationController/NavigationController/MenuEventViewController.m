//
//  MenuEventViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 25..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuEventViewController.h"
#import "EventCell.h"
#import "ShowMenuViewController.h"


@interface MenuEventViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivTopLine;
@property (weak, nonatomic) IBOutlet UITableView *tvEvent;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) NSArray *titleArr;
@property (strong, nonatomic) NSArray *subTitleArr;
@property (strong, nonatomic) ShowMenuViewController *naviVC;


@end

@implementation MenuEventViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.naviVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self.view insertSubview:self.naviVC.view belowSubview:self.containerView];
    
    [self.util setContentViewLayoutWithSubView:self.naviVC.view withTargetView:self.view];
    self.naviVC.eventVC = self;
    
    //self.naviVC.lbTitle.text = self.title;
    
    self.ivTopLine.backgroundColor = [self.util getColorWithRGBCode:@"424242"];
    self.tvEvent.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    self.containerView.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    
    self.titleArr = @[@"SM TOWN MEMBERSHIP 2월달 혜택 안내"];
    self.subTitleArr  = @[@"2016년 02월 18일"];
    self.tvEvent.rowHeight = WRATIO_WIDTH(165.0f) + WRATIO_WIDTH(82.0f);
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"eventCell";
    
    EventCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil)
    {
        cell = [[EventCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.lbTitle.text = self.titleArr[indexPath.row];
    cell.lbSubTitle.text = self.subTitleArr[indexPath.row];

    cell.ivButton.image = [UIImage imageNamed:@"btn_menu_go"];
    cell.contentView.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];
    cell.lbTitle.font = [UIFont systemFontOfSize:WRATIO_WIDTH(44.0f)];
    cell.lbSubTitle.font = [UIFont systemFontOfSize:WRATIO_WIDTH(38.0f)];
    cell.lbTitle.textColor = [self.util getColorWithRGBCode:@"424242"];
    cell.lbSubTitle.textColor  = [self.util getColorWithRGBCode:@"7d7d7d"];
    
    return cell;
 
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
