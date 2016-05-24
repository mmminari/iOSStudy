//
//  MenuViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuViewController.h"
#import "ShowMenuViewController.h"

typedef NS_ENUM(NSInteger, MenuList)
{
    MenuListPush = 0,
    MenuListEvent,
    MenuListNotice,
    MenuListCustomerCenter,
    MenuListAgreement,
    MenuListUserInfo,
    MenuListVersionNum,
    
};

@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivUser;
@property (weak, nonatomic) IBOutlet UIImageView *ivSetting;
@property (weak, nonatomic) IBOutlet UILabel *lbUserName;
@property (weak, nonatomic) IBOutlet UILabel *lbUserId;
@property (strong, nonatomic) NSArray *menuArr;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfMenuView;


@property (weak, nonatomic) IBOutlet UITableView *tvMenu;


@end

@implementation MenuViewController

-(void)viewDidLoad
{
    self.ivSetting.image = [UIImage imageNamed:@"menu_setting"];
    self.ivUser.image = [UIImage imageNamed:@"img_profile_menu"];
    
    self.lbUserName.text = [self.userInfo userName];
    self.lbUserId.text = [self.userInfo userId];
    
    self.ivUser.layer.cornerRadius = 50.0f;
    self.ivUser.layer.masksToBounds = YES;

    [self downLoadImage];
    
    
    self.menuArr = @[@"PUSH 알림", @"이벤트", @"공지사항", @"고객센터", @"이용약관", @"개인정보 취급방침", @"버전정보"];
    
    self.alcWidthOfMenuView.constant = WRATIO_WIDTH(REMAIN_SPACE);

}


-(void)downLoadImage
{
    NSURLSessionDataTask *dataTask;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.userInfo profileImg]]];
    dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        UIImage *image = [[UIImage alloc]initWithData:data];

        self.ivUser.image = image;
        
    }];
    
    [dataTask resume];
    
}

#pragma mark - TableView DataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"menuCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    cell.textLabel.text = self.menuArr[indexPath.row];
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuList menuList = indexPath.row;
    
    NSLog(@"%zd", menuList);
    
    NSString *title = self.menuArr[menuList];
    //[self performSegueWithIdentifier:@"sgMenuToShowMenu" sender:title];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"sgMenuToShowMenu"])
    {
        ShowMenuViewController *showVC = [segue destinationViewController];

        if([sender isKindOfClass:[NSString class]])
        {
            showVC.title = sender;
            NSLog(@"hi");
        }
    }
}

@end
