//
//  HomeViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 4. 27..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "HomeViewController.h"


#define MEMBERINFO_API                                          @"https://pointapibeta.smtown.com/api/v1/memberInfo"

@interface MemberInfo : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *cardNo;
@property (strong, nonatomic) NSString *point;


@end

@implementation MemberInfo



@end

@interface HomeViewController ()

@property (strong, nonatomic) MemberInfo *MemberInfo;

@property (weak, nonatomic) IBOutlet UIImageView *ivUser;
@property (weak, nonatomic) IBOutlet UILabel *lbUserName;
@property (weak, nonatomic) IBOutlet UILabel *lbUserEmail;

@property (weak, nonatomic) IBOutlet UILabel *lbAvailablePoint;
@property (weak, nonatomic) IBOutlet UILabel *lbShowPoint;
@property (weak, nonatomic) IBOutlet UILabel *lbPoint;
@property (weak, nonatomic) IBOutlet UIImageView *ivCard;
@property (weak, nonatomic) IBOutlet UILabel *lbBarCord;

@end




@implementation HomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.MemberInfo = [[MemberInfo alloc] init];
    
    
    self.ivUser.image = [UIImage imageNamed:@"img_main_profile"];
    self.ivCard.image = [UIImage imageNamed:@"img_card_main"];
    
    [self startSession];
    
    
}

-(void)startSession
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:MEMBERINFO_API];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPMethod:@"GET"];
    
    NSDictionary *HTTPBodyDic = @{@"lang" : @"ko" };
    
    NSError *error;
    
    [urlRequest setHTTPBody:[NSJSONSerialization dataWithJSONObject:HTTPBodyDic options:0 error:&error]];
    
    [[session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        id sentData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        if([sentData isKindOfClass:[NSArray class]])
        {
            NSLog(@"erorr");
        }
        if([sentData isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *sentDataDic;
            sentDataDic = sentData;
            [self processingUrlRequestWithParam:sentDataDic ];
            
            
        }
    }] resume];
    
    
}

-(void)processingUrlRequestWithParam:(id)param
{
    NSDictionary *userInfo = [param objectForKey:@"userInfo"];
    NSDictionary *pointInfo = [param objectForKey:@"pointInfo"];
    
    NSString *userId = [userInfo objectForKey:@"userId"];
    
    NSLog(@"%@", userId);
    
    
    if([self.userData isEqualToString:userId]){
        self.lbUserName = [userInfo objectForKey:@"userName"];
        self.lbUserEmail.text = [userInfo objectForKey:@"userId"];
        self.lbPoint.text = [pointInfo objectForKey:@"point"];
        
        
    }
    
    
}

@end

