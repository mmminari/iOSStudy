//
//  BaseViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 4..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "BaseViewController.h"
#import "ShowMenuViewController.h"


@implementation BaseViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.util = [[UtilityClass alloc]init];
    
}

-(void)setTitleOfNavibarWithMenuList:(MenuList)list
{
    ShowMenuViewController *showVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    
    [self addChildViewController:showVC];
    
    NSString *title = [self getTitleOfNaviWithMenuType:list];
 
    [self.view addSubview:showVC.view];
    [self.util setContentViewLayoutWithSubView2:showVC.view withTargetView:self.view];
    
    showVC.lbTitle.text = title;
    showVC.baseVC = self;
    
    
    
}

-(NSString *)getTitleOfNaviWithMenuType:(MenuList )menuList
{
    NSString *result = nil;
    
    switch (menuList) {
        case MenuListEvent:
            result = @"이벤트";
            break;
        case MenuListNotice:
            result = @"공지사항";
            break;
        case MenuListCustomerCenter:
            result = @"고객센터";
            break;
        case MenuListAgreement:
            result = @"이용약관";
            break;
        case MenuListUserInfo:
            result = @"회원정보";
            break;
        default:
            break;
    }
    
    return result;
}


@end
