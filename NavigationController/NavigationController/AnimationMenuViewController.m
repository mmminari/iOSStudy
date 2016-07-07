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

@end

@implementation AnimationMenuViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.menuList = [NSMutableArray array ];//alloc]initWithArray: @[@"aㅁa", @"bㅠb", @"cㅇc"]];
    self.ivIcon.image = [UIImage imageNamed:@"icon_close"];
    
    self.alcHeightOfTbMenu.constant = self.menuList.count * 40.0f;
    self.lbShowMenu.text = @"aㅁa";
    
}

- (IBAction)touchedShowMenu:(id)sender
{
    if(self.menuList.count == 0)
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
    }
    else
    {
        [self.menuList removeObject:@"cㅇc"];
        NSArray *paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
        [self.tvMenu deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationBottom];
        
        [self.menuList removeObject:@"bㅠb"];
        paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
        [self.tvMenu deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationBottom];
        
        [self.menuList removeObject:@"aㅁa"];
        paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
        [self.tvMenu deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationBottom];
    }
    
    [self.tvMenu reloadData];
    
    self.alcHeightOfTbMenu.constant = self.menuList.count * 40.0f;
    
    [self setAnimation];
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
    self.ivIcon.image = [UIImage imageNamed:@"icon_close"];
    
    self.alcHeightOfTbMenu.constant = 0;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 1.0;
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];
    [self.tvMenu.layer addAnimation:animation forKey:@"animateOpacity"];
    [self setAnimation];
}

-(void)openMenu
{
    self.ivIcon.image = [UIImage imageNamed:@"icon_open"];
    
    self.alcHeightOfTbMenu.constant = 120;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 1.0;
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:1.0f];
    [self.tvMenu.layer addAnimation:animation forKey:@"animateOpacity"];
    [self setAnimation];
}

-(void)setAnimation
{
    NSTimeInterval duration = 0.4f;
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:duration delay:0.0f options:animationOptions animations:^{
        [self.view layoutIfNeeded];
        
    } completion:nil];
}


@end
