//
//  DemoListViewController.m
//  NavigationController
//
//  Created by DEV_TEAM1_IOS on 2016. 4. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "DemoListViewController.h"
#import "ViewController.h"
#import "WebViewController.h"


typedef NS_ENUM(NSInteger, DemoType)
{
    DemoTypeTextAttributedString = 0,
    DemoTypeWebView,
    DemoTypeIntroUiView,
    DemoTypeCollectionView,
};

@interface DemoListViewController ()

@property (strong, nonatomic) NSArray *list;


@property (weak, nonatomic) IBOutlet UITableView *tvList;

@end

@implementation DemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.list = [self getMenuListInfo];
}


#pragma mark - Table View Datasource
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ListCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = self.list[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoType demoType = indexPath.row;
    
    NSString *sgId = [self getSegueIndentifierWithDemoType:demoType];
    
    NSString *targetViewTitle = [self getTitleWithDemoType:demoType];
    
    [self performSegueWithIdentifier:sgId sender:targetViewTitle];
}

#pragma mark - Private Method
- (NSArray *)getMenuListInfo
{
    NSArray *listInfo = @[@"TextAttributedString",@"WebView",@"IntroUiView",@"CollectionView"];
    
    return listInfo;
}

- (NSString *)getTitleWithDemoType:(DemoType)demotype
{
    NSString *result = nil;
    
    result = self.list[demotype];
    
    return result;
}

- (NSString *)getSegueIndentifierWithDemoType:(DemoType)demotype
{
    NSString *result = nil;
    
    switch (demotype)
    {
        case DemoTypeTextAttributedString:
            result = @"sgMainToTextView";
            break;
        case DemoTypeWebView:
            result = @"sgMainToWebView";
            break;
        case DemoTypeIntroUiView:
            result = @"sgMainToUIView";
            break;
        case DemoTypeCollectionView:
            result = @"sgMainToCollectionView";
            break;
            
        default:
            break;
    }
    
    return result;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"sgMainToTextView"])
    {
        ViewController *vc = [segue destinationViewController];
        vc.title = sender;
    }
    
    if([[segue identifier] isEqualToString:@"sgMainToWebView"])
    {
        WebViewController *wc = [segue destinationViewController];
        wc.title = sender;

    }
    
    if([[segue identifier] isEqualToString:@"sgMainToCollectionView"])
    {
        
        
    }
    
    

}



@end





