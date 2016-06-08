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
#import "StoreInformation.h"

#define STORE_API                                               @"http://pointapibeta.smtown.com/api/v1/brand"



@interface StoreViewController ()


@property (strong, nonatomic) NSDictionary *responseDic;
@property (strong, nonatomic) NSArray *responseArr;
@property (weak, nonatomic) IBOutlet UITableView *tvStore;

@property (strong, nonatomic) NSMutableArray *imageArr;
@property (strong, nonatomic) NSMutableDictionary *downloaingDic;

@property (strong, nonatomic) NSMutableArray *storeArr;
@property (assign, nonatomic) CGFloat rationHeight;


@end

@implementation StoreViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self stratSession];
    
    self.view.backgroundColor = [self.util getColorWithRGBCode:@"f9f9f0"];

    self.downloaingDic = [NSMutableDictionary dictionary];
    self.imageArr = [NSMutableArray array];
    self.storeArr = [NSMutableArray array];

}

#pragma mark - set layout

-(void)setLayoutwithCell:(StoreCell *)cell
{
    cell.lbName.font = [UIFont boldSystemFontOfSize:WRATIO_WIDTH(62.0f)];
    cell.lbSaleInfo.font = [UIFont systemFontOfSize:WRATIO_WIDTH(40.0f)];
    cell.lbDetail.font = [UIFont systemFontOfSize:WRATIO_WIDTH(40.0f)];
    cell.lbLocation.font = [UIFont systemFontOfSize:WRATIO_WIDTH(40.0f)];
    cell.lbPhoneNum.font = [UIFont systemFontOfSize:WRATIO_WIDTH(40.0f)];
    
    cell.lbName.textColor = [self.util getColorWithRGBCode:@"424242"];
    cell.lbSaleInfo.textColor = [self.util getColorWithRGBCode:@"f386a1"];
    cell.lbDetail.textColor = [self.util getColorWithRGBCode:@"6b6a6a"];
    cell.lbLocation.textColor = [self.util getColorWithRGBCode:@"6b6a6a"];
    cell.lbPhoneNum.textColor = [self.util getColorWithRGBCode:@"6b6a6a"];
    
}

#pragma mark - tableview

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


#pragma mark - table view cell

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"StoreCell";
    
    StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.storeVC = self;
    
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
    
    [self setLayoutwithCell:cell];
    
    NSInteger index = indexPath.row;
    
    StoreInformation *stInfo = self.storeArr[index];

    cell.lbName.text = [stInfo name];
    cell.lbSaleInfo.text = [stInfo saleInfo];
    cell.lbDetail.text = [stInfo explain];
    cell.lbLocation.text = [stInfo address];
    cell.lbPhoneNum.text = [stInfo phone];
    
    NSString *height = [stInfo imageInfoHeight];
    CGFloat imgHeight = [height floatValue];
    
    NSString *widht = [stInfo imageInfoWidth];
    CGFloat imgWidth = [widht floatValue];
    NSLog(@"%f", imgWidth);
    
    self.rationHeight = (DEVICE_WIDTH - WRATIO_WIDTH(40.0f)*2) * 3 * imgHeight  / imgWidth ;
    
    cell.alcHeightOfImg.constant = WRATIO_WIDTH(self.rationHeight);
    cell.alcHeightOfImg.constant = WRATIO_WIDTH(1139.0f);
    cell.alcTopOfNameLabel.constant = WRATIO_WIDTH(72.0f);
    cell.alcLeadingOfNameLabel.constant = WRATIO_WIDTH(78.0f);
    cell.alcTopOfExplain.constant = WRATIO_WIDTH(34.0f);
    cell.alcLeadingOfExplain.constant = WRATIO_WIDTH(78.0f);
    cell.alcTopOfDetail.constant = WRATIO_WIDTH(60.0f);
    cell.alcLeadingOfDetail.constant = WRATIO_WIDTH(78.0f);
    cell.alcTopOfAddress.constant = WRATIO_WIDTH(60.0f);
    cell.alcLeadingOfAddress.constant = WRATIO_WIDTH(78.0f);
    cell.alcTopOfPhone.constant = WRATIO_WIDTH(39.0f);
    cell.alcLeadingOfPhone.constant =WRATIO_WIDTH(78.0f);
    cell.alcWidthOfLocImg.constant = WRATIO_WIDTH(57.0f);
    cell.alcWidthOfPhoImg.constant = WRATIO_WIDTH(57.0f);
    cell.alcHeightOfLocImg.constant = WRATIO_WIDTH(57.0f);
    cell.alcHeightOfPhoImg.constant = WRATIO_WIDTH(57.0f);
    cell.alcTopOfLbPhone.constant = WRATIO_WIDTH(12.0f);
    cell.alcTopOfLbLocation.constant = WRATIO_WIDTH(12.0f);

    NSUInteger count = self.responseArr.count;
    
    if(count > 0)
    {
        NSString *urlString = [stInfo imageInfoUri];
        
        UIImage *image = nil;
        
        @try
        {
            image = self.imageArr[index];
        }
        @catch (NSException *exception)
        {
            
        }

        if(!image)
        {
            [self startImageDownload:urlString forIndexPath:indexPath];

            cell.ivMain.image = [UIImage imageNamed:@"loading"];
        }
        else //이미지가 있을때의 처리작업
        {
            cell.ivMain.image = image;
        }
    }
    
    return cell;
    
}

#pragma mark - table view delegate

-(CGFloat)getHeightOfLabelWithText:(NSString *)text
{
    CGFloat screenWidht = DEVICE_WIDTH;
    CGFloat maxWidth = screenWidht - 20.0f;
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    
    CGRect rect = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:WRATIO_WIDTH(40.0f)]} context:nil];
    
    return rect.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSInteger index = indexPath.row;
    
    NSDictionary *storeInfo = [self.responseArr objectAtIndex:index];
    
    StoreInformation *storeInformation = [[StoreInformation alloc] initWithResults:storeInfo];
    
    CGFloat screenWidht = DEVICE_WIDTH;
    CGFloat maxWidth = screenWidht - 66.0f;
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    
    CGRect rect = [[storeInformation name] boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:WRATIO_WIDTH(40.0f)]} context:nil];
    
    CGFloat heightName = rect.size.height;
    
    CGFloat heightSale = [self getHeightOfLabelWithText:[storeInformation saleInfo]];

    CGFloat heightDetail = [self getHeightOfLabelWithText:[storeInformation explain]];
    CGFloat heightLocation = [self getHeightOfLabelWithText:[storeInformation address]];
    CGFloat heightPhone = [self getHeightOfLabelWithText:[storeInformation phone]];
    
    return heightName + heightSale + heightDetail + heightLocation + heightPhone + WRATIO_WIDTH(314.0f) + WRATIO_WIDTH(self.rationHeight)  + 70.0f;
}


#pragma mark - session task

-(void)stratSession
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:STORE_API];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          id sentData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                                          
                                          if ([sentData isKindOfClass:[NSNull class]])
                                          {
                                              NSLog(@"error");
                                          }
                                          else
                                          {
                                              NSDictionary *responseData = sentData;
                                              self.responseArr = [self.util getValueWithKey:@"list" Dictionary:responseData];
                                              for (NSDictionary *dic in self.responseArr)
                                              {
                    
                                                  StoreInformation *storeInformation = [[StoreInformation alloc] initWithResults:dic];
                                                  [self.storeArr addObject:storeInformation];

                                              }
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [self.tvStore reloadData];
                                                  
                                              });
                                          }
            
                                      }];
    
    [dataTask resume];
    
}


#pragma mark - image download

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
                NSLog(@"%@", self.imageArr[indexPath.row]);
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

-(void)loadImagesOnscreenRows
{
    if(self.imageArr.count > 0)
    {
        NSArray *arr = [self.tvStore indexPathsForVisibleRows];
        for(NSIndexPath *indexPath in arr)
        {
            UIImage *image = nil;
            @try
            {
                StoreCell *cell = [self.tvStore cellForRowAtIndexPath:indexPath];
                image = self.imageArr[indexPath.row];
                cell.ivMain.image = image;
            }
            @catch (NSException *exception)
            {
                
            }

            if(!image)
            {
                NSString *url = [self.util getValueWithKey:@"uri" Dictionary:[self.util getValueWithKey:@"imageInfo" Dictionary:[self.responseArr objectAtIndex:indexPath.row]]];
                NSLog(@"uri %@", url);
                
                [self startImageDownload:url forIndexPath:indexPath];
            }
        }
    }
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        [self loadImagesOnscreenRows];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesOnscreenRows];
}



@end
