//
//  SUMMainViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 11. 17..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "SUMMainViewController.h"
#import "MainContainerView.h"
#import "HTTPClient.h"
#import "EpEpisodeModels.h"


@interface SUMMainViewController () 

@property (strong, nonatomic) MainContainerView *mainView;
@property (strong, nonatomic) HTTPClient *httpClient;


@end

@implementation SUMMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.httpClient = [[HTTPClient alloc]initWithSUMBaseURL];
    
    [self reqEpisodeList];
}

#pragma mark - Request
-(void)reqEpisodeList
{
    [self.httpClient GETWithUrlString:@"/api/v1/episode/list" parameters:nil success:^(id results) {
        [self successCompletionOfReqEpisodeListWithResults:results];
        
    } failure:^(NSError *error) {
        LogRed(@"error");
    }];
}

#pragma mark - Process
- (void)successCompletionOfReqEpisodeListWithResults:(id)results
{
    EpEpisodeModel *result = [[EpEpisodeModel alloc]initWithDictionary:results];
    
    if([result.code isEqualToString:@"200"])
    {
        LogGreen(@"success");
        
        self.mainView = [[[NSBundle mainBundle] loadNibNamed:@"MainContainerView" owner:self options:nil]lastObject];
        
        self.mainView.epList = result.list;

        [self.view addSubview:self.mainView];
        
        [self.view layoutIfNeeded];
        
    }
    
}

    


@end
