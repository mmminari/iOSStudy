//
//  AnimationMenuViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 7. 7..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "AnimationMenuViewController.h"

@interface AnimationMenuViewController ()

@property (strong, nonatomic) NSMutableArray *menuList;
@property (weak, nonatomic) IBOutlet UILabel *lbShowMenu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTbMenu;
@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet UITableView *tvMenu;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (assign, nonatomic) BOOL isOpened;

@end

@implementation AnimationMenuViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.menuList = [NSMutableArray new];
}

- (IBAction)touchedShowMenu:(id)sender
{
    self.ivIcon.highlighted = !self.isOpened;
    
    if(self.isOpened)
    {
        [self closeMenu];
    }
    else
    {
        [self openMenu];
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"animationCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth = 1.0f;
    
    cell.textLabel.text = self.menuList[indexPath.row];

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuList.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    self.lbShowMenu.text = self.menuList[indexPath.row];
    [self closeMenu];

}

-(void)closeMenu
{
    [self.menuList removeAllObjects];
    NSMutableArray *pathArr = [NSMutableArray new];
    for (NSInteger i; i < [self getList].count; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [pathArr addObject:indexPath];
    }

    [self.tvMenu deleteRowsAtIndexPaths:pathArr withRowAnimation:UITableViewRowAnimationBottom];
    
}

-(void)openMenu
{
    
    [self.menuList addObject:@"aㅁa"];
    NSArray *paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.tvMenu insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationBottom];
    
    [self.menuList addObject:@"bㅠb"];
    paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:self.menuList.count-1 inSection:0]];
    [self.tvMenu insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationBottom];
    
    [self.menuList addObject:@"cㅇc"];
    paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:self.menuList.count-1 inSection:0]];
    [self.tvMenu insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationBottom];
    
    [self.tvMenu reloadData];
    
    self.alcHeightOfTbMenu.constant = self.menuList.count * 40.0f;
    
}

-(NSArray *)getList
{
    NSArray *result = @[@"aa", @"bb", @"cc"];
    return result;
}

@end
