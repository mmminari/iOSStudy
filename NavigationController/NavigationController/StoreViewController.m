//
//  StoreViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreCell.h"
#import "ImageDownload.h"

#define STORE_API                                               @"http://pointapibeta.smtown.com/api/v1/brand"



@interface StoreViewController ()


@property (strong, nonatomic) NSDictionary *responseDic;
@property (strong, nonatomic) NSArray *responseArr;
@property (weak, nonatomic) IBOutlet UITableView *tvStore;

@property (strong, nonatomic) NSMutableArray *imageArr;
@property (strong, nonatomic) NSMutableDictionary *downloaingDic;


@end

@implementation StoreViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self stratSession];
    
    self.downloaingDic = [NSMutableDictionary dictionary];
 

}

-(void)stratSession
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:STORE_API];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          
                                          id sentData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                                          NSDictionary *responseData = sentData;
                                          self.responseArr = [responseData objectForKey:@"list"];
                                       //   NSLog(@"%@", self.responseArr);
                                          
                                          [self.tvStore reloadData];

                                      }];
    
    
    [dataTask resume];

}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%zd", self.responseArr.count);
    
    return self.responseArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"StoreCell";
    
    static NSString *languageCode = @"ko";
    
    StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        cell = [[StoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
        cell.lbName.numberOfLines = 0;
        cell.lbName.lineBreakMode = NSLineBreakByWordWrapping;
        
        cell.lbDetail.numberOfLines = 0;
        cell.lbDetail.lineBreakMode = NSLineBreakByWordWrapping;
        
        cell.lbSaleInfo.numberOfLines = 0;
        cell.lbSaleInfo.lineBreakMode = NSLineBreakByWordWrapping;
        
        cell.lbLocation.numberOfLines = 0;
        cell.lbLocation.lineBreakMode = NSLineBreakByWordWrapping;
        
        cell.lbPhoneNum.numberOfLines = 0;
        cell.lbPhoneNum.lineBreakMode = NSLineBreakByWordWrapping;

    }
    
    NSInteger index = indexPath.row;
    
    NSDictionary *storeInfo = [self.responseArr objectAtIndex:index];
    
    NSDictionary *nameDic = [storeInfo objectForKey:@"name"];
    NSString *name = [nameDic objectForKey:languageCode];
    
    cell.lbName.text = name;
        
    
    return cell;
    
    
}

-(void)startImageDownload:(NSString *)url forIndexPath:(NSIndexPath *)indexPath
{
    ImageDownload *imageDown = self.downloaingDic[indexPath];
    
    if(imageDown == nil)
    {
        imageDown = [[ImageDownload alloc] init];
        imageDown.imageArr = self.imageArr;
        imageDown.urlString = url;
        
        [imageDown setCompletionHandler:^{
            StoreCell *cell = [self.tvStore cellForRowAtIndexPath:indexPath];
            
            @try
            {
                cell.ivMain.image = self.imageArr[indexPath.row];
            }
            @catch (NSException *exception)
            {
            }
            
            [self.downloaingDic removeObjectForKey:indexPath];
            
        }];
         
            self.downloaingDic[indexPath] = imageDown;
            [imageDown stardDownload];
    }
}



@end
