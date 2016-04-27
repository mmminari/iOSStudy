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
 
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config  delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
        NSURL *url = [NSURL URLWithString:MEMBERINFO_API];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
        [[session dataTaskWithRequest:request
                                   completionHandler:^(NSData *data, NSURLResponse *response,NSError *error) {
                                       
                                       NSDictionary *sentData;
                                       sentData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                                       NSLog(@"%@", sentData);
                                       
                                       [self processingUrlRequestWithParam:sentData];
                                       
                
                                       
                                       
                                                                                              }] resume];
    
    
}

-(void)processingUrlRequestWithParam:(id)param
{
    
    
    if([self.userData isEqualToString:[[param objectForKey:@"userInfo"] objectForKey:@"userId"]]){
        NSLog(@"성공");
        
        
        
        
    }
    
    
}

@end

