//
//  BaseViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 4..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "BaseViewController.h"
#import "ShowMenuViewController.h"
#import "MenuWebViewController.h"

@interface BaseViewController ()

@property (strong, nonatomic) NSUserDefaults *autoSignIn;


@end

@implementation BaseViewController


//가장먼저실행
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        
    }
    
    return self;
}

//그다음
- (void)awakeFromNib
{
    [super awakeFromNib];
}

//그다음
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.util = [[UtilityClass alloc]init];
    self.library = [LibraryClass sharedInstance]; //싱글톤 초기화
    self.autoSignIn = [NSUserDefaults standardUserDefaults];

}

-(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        if(completion)
        {
            completion();
        }
        LogGreen(@"show aler view message %@", message);
    }];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)setResultOfAutoSignInWithSwith:(BOOL)swith
{
    [self.autoSignIn setBool:swith forKey:@"isAutoSignIn"];
    
}

-(BOOL)getResultOfAutoSignIn
{
    BOOL result = [self.autoSignIn boolForKey:@"isAutoSignIn"];
    
    return result;
}

-(void)setTitleOfNavibarWithIndexPath:(NSIndexPath *)index
{
    ShowMenuViewController *showVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    [self addChildViewController:showVC];
    
    NSString *title = [self getTitleWithIndex:index];
    
    [self.view addSubview:showVC.view];
    [self.util setContentViewLayoutWithSubView2:showVC.view withTargetView:self.view];
    showVC.lbTitle.text = title;
    showVC.baseVC = self;
}

-(NSString *)getTitleWithIndex:(NSIndexPath *)index
{
    NSString *title = nil;
    
    switch (index.row) {
        case 0:
            title = @"카드 새로 등록하기";
            break;
        case 1:
            title = @"카드 비밀번호 변경";
            break;
        case 2:
            title = @"카드 분실 신고";
            break;
        case 3:
            title = @"구매인증 코드 등록";
            break;
        default:
            break;
    }
    
    return title;
    
}

-(void)setTitleOfNavibarWithMenuList:(MenuList)list
{
    ShowMenuViewController *showVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    
    [self addChildViewController:showVC];
    //지역변수로 VC를 셋팅해주었기 때문에 showVC를 childVC로 추가해주어야한다.
    
    NSString *title = [self getTitleOfNaviWithMenuType:list];
 
    [self.view addSubview:showVC.view];
    [self.util setContentViewLayoutWithSubView2:showVC.view withTargetView:self.view];
    
    showVC.lbTitle.text = title;
    showVC.baseVC = self; //각 VC를 baseVC에 담아서 필요할 때 사용.

}

- (void)setCustomNavigationBarWithTitle:(NSString *)title
{
    ShowMenuViewController *showVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-navigation"];
    
    [self addChildViewController:showVC];
    
    [self.view addSubview:showVC.view];
    [self.util setContentViewLayoutWithSubView2:showVC.view withTargetView:self.view];
    showVC.ivBack.image = [UIImage imageNamed:@"btn_popup_close"];
    showVC.lbTitle.text = title;
    showVC.baseVC = self; //각 VC를 baseVC에 담아서 필요할 때 사용.
}

-(void)setWebViewWithMenuList:(MenuList)list
{
    MenuWebViewController *webVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-menuWebView"];
    [self addChildViewController:webVC];
    
    [self.view addSubview:webVC.view];
    [self.util setContentViewLayoutWithSubView3:webVC.view withTargetView:self.view];
    
    webVC.urlString = [self getUrlStringWithMenuList:list];
    [webVC urlRequestWithUrl:webVC.urlString];
    
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
            result = @"개인정보 취급방침";
            break;
        default:
            break;
    }
    
    return result;
}

-(NSString *)getUrlStringWithMenuList:(MenuList )menuList
{
    NSString *result = nil;
    
    switch (menuList) {
        case MenuListEvent:
            result = @"https://pointapibeta.smtown.com/event";
            break;
        case MenuListNotice:
            result = @"https://pointapibeta.smtown.com/notice";
            break;
        case MenuListCustomerCenter:
            result = @"https://pointapibeta.smtown.com/Faq";
            break;
        case MenuListAgreement:
            result = @"https://pointapibeta.smtown.com/policy/terms";
            break;
        case MenuListUserInfo:
            result = @"https://pointapibeta.smtown.com/policy/privacy";
            break;
        default:
            break;
    }
    
    return result;
}

@end
