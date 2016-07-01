//
//  MenuViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "MenuViewController.h"
#import "ShowMenuViewController.h"
#import "MenuCell.h"
#import "SettingViewController.h"
#import "LogInViewController.h"


@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivUser;
@property (weak, nonatomic) IBOutlet UILabel *lbUserName;
@property (weak, nonatomic) IBOutlet UILabel *lbUserId;
@property (strong, nonatomic) NSArray *menuArr;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfMenuView;

@property (weak, nonatomic) IBOutlet UIImageView *ivLine;

@property (weak, nonatomic) IBOutlet UITableView *tvMenu;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcCenterOfLbName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfIcon;
@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfUserImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfUserImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfSettingImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfSettingImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfUserImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfBtnLogIn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfLogInOutView;

@property (strong, nonatomic) SettingViewController *settingVC;
@property (strong, nonatomic) LogInViewController *loginVC;

@property (weak, nonatomic) IBOutlet UILabel *lbLogOut;
@property (weak, nonatomic) IBOutlet UIButton *btnLogIn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfBtnLogIn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcCenterOfLbLogOut;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfBtnLogIn;

@property (weak, nonatomic) IBOutlet UIImageView *ivSetting;
@property (weak, nonatomic) IBOutlet UIButton *btnSetting;
@property (weak, nonatomic) IBOutlet UIImageView *ivCameraRoll;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfCameraRollImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfCameraRollImg;

@property (strong, nonnull) UIImage *profileImage;

@end

@implementation MenuViewController

-(void)viewDidLoad
{
    //상위뷰 초기화 꼭 하기
    [super viewDidLoad];
    
    [self.logOutViewContainer setHidden:YES];
    
    if(![self getResultOfAutoSignIn])
    {
        [self setMenuLogOutLayOut];
        self.ivUser.image = [UIImage imageNamed:@"img_profile_menu"];
    }
    else
    {
        [self checkExistenceOfImage];
    }
    
    self.settingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-settingView"];
    self.loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-logInView"];
    
    self.ivSetting.image = [UIImage imageNamed:@"menu_setting"];
    self.ivUser.image = [UIImage imageNamed:@"img_profile_menu"];
    self.ivIcon.image = [UIImage imageNamed:@"icon_grade_vip"];
    self.ivCameraRoll.image = [UIImage imageNamed:@"btn_profile_modify"];
    
    self.menuArr = @[@"PUSH 알림", @"이벤트", @"공지사항", @"고객센터", @"이용약관", @"개인정보 취급방침", @"버전정보"];
    
    self.lbUserName.text = [self.library.userInfo userName];
    self.lbUserId.text = [self.library.userInfo userId];
    
    self.ivUser.image = [UIImage imageNamed:@"img_profile_menu"];
    [self setLayout];

}

-(void)viewWillAppear:(BOOL)animated
{
    [self checkExistenceOfImage];
    
}

-(void)downLoadImage
{
    NSURLSessionDataTask *dataTask;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.library.userInfo profileImg]]];
    dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        UIImage *image = [[UIImage alloc]initWithData:data];
        
        if(!image)
        {
            self.ivUser.image = [UIImage imageNamed:@"img_profile_menu"];
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.ivUser.image = image;
                
            });
            
            NSData *imageData = UIImagePNGRepresentation(image);
            //cache에 저장
            [self.library setObject:imageData forKey:[self getNameOfTheImage]];
            
            //documents에 저장
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentDirectory = [paths objectAtIndex:0];
            documentDirectory= [NSString stringWithFormat:@"%@/%@", documentDirectory, [self getNameOfTheImage]];
            
            BOOL result =  [imageData writeToFile:documentDirectory atomically:YES];
            LogYellow(@"result : %zd", result);
        }
        
    }];
    
    [dataTask resume];
    
}
/*
- (NSURL*)applicationDataDirectory
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *urlArr = [manager URLsForDirectory:NSApplicationSupportDirectory
                                             inDomains:NSUserDomainMask];
    
    NSURL* appSupportDir, *appDirectory = nil;
    
    if ([urlArr count] >= 1)
    {
        appSupportDir = [urlArr objectAtIndex:0];
        if(appSupportDir)
        {
            NSString* appBundleID = [[NSBundle mainBundle] bundleIdentifier];
            appDirectory = [appSupportDir URLByAppendingPathComponent:appBundleID];
        }
    }
    
    return appDirectory;
}
*/

#pragma mark - User Action

- (IBAction)touchedGoToSettingView:(id)sender
{
    [self.mainVC performSegueWithIdentifier:@"sgMenuToSetting" sender:nil];
    NSLog(@"hi");
}

- (IBAction)touchedGoToLogInView:(id)sender
{
    [self.mainVC.navigationController pushViewController:self.loginVC animated:YES];
    
}

- (IBAction)touchedGoToCameraRoll:(id)sender
{
    [self startCameraControllerFromViewController:self.mainVC usingDelegate:self];
    LogYellow(@"startCameraControllerFromViewController");
}

#pragma mark - TableView DataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"menuCell";
    
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        cell = [[MenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    //talbeviewcell을 custom으로 사용할 경우 내장된 라벨을 사용하면 안됨. 라벨도 커스텀으로 넣어주어야 정상작동
    cell.lbMenuText.text = self.menuArr[indexPath.row];
    cell.contentView.layer.borderColor = [self.util getColorWithRGBCode:@"eeeeee"].CGColor;
    cell.lbMenuText.font = [UIFont systemFontOfSize:WRATIO_WIDTH(47.0f)];
    cell.lbMenuText.textColor = [self.util getColorWithRGBCode:@"424242"];
    
    cell.lbVersion.text = [self getBundleAppVersion];
    [cell.swNotice setHidden:YES];
    [cell.lbVersion setHidden:YES];
    
    if(indexPath.row == 0)
    {
        [cell.swNotice setHidden:NO];
    }
    else if(indexPath.row == 6)
    {
        [cell.lbVersion setHidden:NO];
    }

    return cell;
    
}

//NSBundle 사용해서 앱 버전 정보 가져오기
-(NSString *)getBundleAppVersion
{
    NSString *result = nil;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *dic = bundle.infoDictionary;
    result = [dic objectForKey:@"CFBundleVersion"];
    
    return result;
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
    
    NSString *stid = nil;
    
    switch (menuList) {
        case MenuListEvent:
            stid = @"stid-event";
            break;
        case MenuListNotice:
            stid = @"stid-notice";
            break;
        case MenuListCustomerCenter:
            stid = @"stid-cuscenter";
            break;
        case MenuListAgreement:
            stid = @"stid-agreement";
            break;
        case MenuListUserInfo:
            stid = @"stid-userinfo";
            break;
        default:
            break;
    }
    
    [self.mainVC moveToTheTargetViewWithMenuList:menuList];
}

#pragma makr - UIImagPickercontroller

//카메라롤 접근~
-(BOOL)startCameraControllerFromViewController:(UIViewController *)controller usingDelegate:(id <UIImagePickerControllerDelegate, UINavigationControllerDelegate>) delegate
{
    /*
    if(([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) || (delegate == nil) || (controller == nil))
        return NO;
    */
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc]init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    cameraUI.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    cameraUI.delegate = delegate;
    
    [controller presentViewController:cameraUI animated:YES completion:nil];
    
    return YES;
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.mainVC dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    indicator.center = CGPointMake(DEVICE_WIDTH/2, DEVICE_HEIGHT/2);
    [picker.view addSubview:indicator];
    [indicator startAnimating];
    [picker.view setUserInteractionEnabled:NO];
    [indicator setHidesWhenStopped:YES];
    
    LogYellow(@"imageinfo : %@", info);
    
   // NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    self.profileImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    LogGreen(@"profile image %@", self.profileImage );
    NSData *data = UIImageJPEGRepresentation(self.profileImage, 1.0);
    
    [self.library requestProfileImageWithSuccess:^(id results) {
        
        if(results)
        {
            [indicator stopAnimating];
            [picker.view setUserInteractionEnabled:YES];
            
            [self.mainVC dismissViewControllerAnimated:YES completion:^{
                [self showAlertViewWithTitle:nil message:[self.util getValueWithKey:@"message" Dictionary:results] completion:^
                {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadUserProfile" object:nil];
                }];
                
            }];

            LogGreen(@"results %@", [results objectForKey:@"message"]);
        }
        
        
    } failure:^(NSError *error) {
        [indicator stopAnimating];
        [picker.view setUserInteractionEnabled:YES];
        LogRed(@"error")    ;
        
        
    } imageInfo:data];

    
}

#pragma mark - private method

-(void)checkExistenceOfImage
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    documentDirectory= [NSString stringWithFormat:@"%@/%@", documentDirectory, [self getNameOfTheImage]];
    
    if([self.library getObjectWithKey:[self getNameOfTheImage]] == nil)
    {
        if([[NSFileManager defaultManager]contentsAtPath:documentDirectory] == nil)
        {
            [self downLoadImage];
        }
        else
        {
            self.ivUser.image = [UIImage imageWithData:[[NSFileManager defaultManager]contentsAtPath:documentDirectory]];
        }
    }
    else
    {
        self.ivUser.image = [UIImage imageWithData:[self.library getObjectWithKey:[self getNameOfTheImage]]];
    }

}

-(NSString *)getNameOfTheImage
{
    NSArray *queryArr = [[self.library.userInfo profileImg] componentsSeparatedByString:@"/"];
    NSString *result = [queryArr lastObject];
    
    return result;
}

-(void)setLayout
{
    self.ivUser.layer.cornerRadius = WRATIO_WIDTH(300.0f)/2;
    self.ivUser.layer.masksToBounds = YES;
    
    self.ivCameraRoll.layer.cornerRadius = WRATIO_WIDTH(102.0f)/2 ;
    self.ivCameraRoll.layer.masksToBounds = YES;
    
    self.alcHeightOfCameraRollImg.constant = WRATIO_WIDTH(102.0f);
    self.alcWidthOfCameraRollImg.constant = WRATIO_WIDTH(102.0f);
    
    self.alcWidthOfMenuView.constant = WRATIO_WIDTH(REMAIN_SPACE);
    self.alcCenterOfLbName.constant = self.alcCenterOfLbName.constant - WRATIO_WIDTH(102.0f)/2;
    
    self.ivLine.backgroundColor = [self.util getColorWithRGBCode:@"eeeeee"];
    
    self.tvMenu.rowHeight = WRATIO_WIDTH(155.0f);
    self.alcHeightOfTableView.constant = self.tvMenu.rowHeight * self.menuArr.count;
    self.alcHeightOfUserImg.constant = WRATIO_WIDTH(300.0f);
    self.alcWidthOfUserImg.constant = WRATIO_WIDTH(300.0f);
    self.alcTopOfTableView.constant = WRATIO_WIDTH(635.0f);
    self.alcHeightOfSettingImg.constant = HRATIO_HEIGHT(69.0f);
    self.alcWidthOfSettingImg.constant = WRATIO_WIDTH(69.0f);
    self.alcTopOfUserImg.constant = WRATIO_WIDTH(135.0f);
    self.alcHeightOfIcon.constant = HRATIO_HEIGHT(48.0f);
    self.alcWidthOfIcon.constant = WRATIO_WIDTH(102.0f);
    self.alcTopOfBtnLogIn.constant = WRATIO_WIDTH(66.0f);
    self.alcHeightOfBtnLogIn.constant = HRATIO_HEIGHT(117.0f);
    self.alcWidthOfBtnLogIn.constant = WRATIO_WIDTH(225.0f);
    self.alcHeightOfLogInOutView.constant = HRATIO_HEIGHT(198.0f);
    self.alcCenterOfLbLogOut.constant = self.alcCenterOfLbLogOut.constant - WRATIO_WIDTH(225.0f) / 2;
    self.alcTopOfBtnLogIn.constant = HRATIO_HEIGHT(50.0f);
    
    self.lbUserName.font = [UIFont systemFontOfSize:WRATIO_WIDTH(47.0f)];
    self.lbUserId.font = [UIFont systemFontOfSize:WRATIO_WIDTH(40.0f)];
    
    self.lbLogOut.text = @"로그인이 필요 합니다.";
    [self.btnLogIn setTitle:@"로그인" forState:UIControlStateNormal];
    [self.btnLogIn setTitleColor:[self.util getColorWithRGBCode:@"ffffff"] forState:UIControlStateNormal];
    [self.btnLogIn setBackgroundColor:[self.util getColorWithRGBCode:@"f386a1"]];
    [self.btnLogIn.titleLabel setFont:[UIFont systemFontOfSize:WRATIO_WIDTH(50.0f)]];
    self.lbLogOut.font = [UIFont systemFontOfSize:WRATIO_WIDTH(45.0f)];
    self.lbLogOut.textColor = [self.util getColorWithRGBCode:@"424242"];
}

-(void)setMenuLogOutLayOut
{
    self.ivUser.image = [UIImage imageNamed:@"img_profile_menu"];
    
    [self.logOutViewContainer setHidden:NO];
    [self.ivSetting setHidden:YES];
    [self.btnSetting setHidden:YES];
    [self.ivCameraRoll setHidden:YES];
}

-(void)setMenuLogInLayOut
{
    self.lbUserName.text = [self.library.userInfo userName];
    self.lbUserId.text = [self.library.userInfo userId];
    [self downLoadImage];
    
    [self.logOutViewContainer setHidden:YES];
    [self.ivSetting setHidden:NO];
    [self.btnSetting setHidden:NO];
    [self.ivCameraRoll setHidden:NO];

}

@end
