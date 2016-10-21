//
//  ViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "DesignPatternViewController.h"
#import "LibraryAPI.h"
#import "Album+TableRepresentation.h"
#import "HorizontalScroller.h"
#import "AlbumView.h"

@interface DesignPatternViewController () < UITableViewDelegate, UITableViewDataSource, HorizontalScrollerDelegate >
{
    UITableView *dataTable;
    NSArray *allAlbums;
    NSDictionary *currentAlbumData;
    NSInteger currentAlbumIndex;
    HorizontalScroller *scroller;
    
    UIToolbar *toolbar;
    NSMutableArray *undoStack;
}

@end

@implementation DesignPatternViewController

#pragma mark - View Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.76f green:0.81f blue:0.87f alpha:1];
    currentAlbumIndex = 0;
    
    toolbar = [[UIToolbar alloc]init];
    UIBarButtonItem *undoItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(undoAction)];
    undoItem.enabled = NO;
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    UIBarButtonItem *delete = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteAlbum)];
    [toolbar setItems:@[undoItem,space,delete]];
    [self.view addSubview:toolbar];
    undoStack = [[NSMutableArray alloc]init];
    
    allAlbums = [[LibraryAPI sharedInstance] getAlbums];
    
    dataTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    dataTable.delegate = self;
    dataTable.dataSource = self;
    dataTable.backgroundView = nil;
    [self.view addSubview:dataTable];
    
    [self showDataForAlbumAtIndex:currentAlbumIndex];
    
    [self loadPreviousState];
    
    scroller = [[HorizontalScroller alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    scroller.backgroundColor = [UIColor colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    scroller.delegate = self;
    [self.view addSubview:scroller];
    
    [self reloadScroller];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCurrentState) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

- (void)viewWillLayoutSubviews
{
    toolbar.frame = CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44);
    dataTable.frame = CGRectMake(0, 130, self.view.frame.size.width, self.view.frame.size.height-200);
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - BarButtonAction

- (void)addAlbum:(Album *)album atIndex:(int)index
{
    [[LibraryAPI sharedInstance] addAlbum:album atIndex:index];
    currentAlbumIndex = index;
    [self reloadScroller];
}

- (void)deleteAlbum
{
    Album *deleteAlbum = allAlbums[currentAlbumIndex];
    
    NSMethodSignature *sig = [self methodSignatureForSelector:@selector(addAlbum:atIndex:)];
    NSInvocation *undoAction = [NSInvocation invocationWithMethodSignature:sig];
    [undoAction setTarget:self];
    [undoAction setSelector:@selector(addAlbum:atIndex:)];
    [undoAction setArgument:&deleteAlbum atIndex:2];
    [undoAction setArgument:&currentAlbumIndex atIndex:3];
    [undoAction retainArguments];
    
    [undoStack addObject:undoAction];
    
    [[LibraryAPI sharedInstance] deleteAlbumAtIndex:currentAlbumIndex];
    [self reloadScroller];
    
    [toolbar.items[0] setEnabled:YES];
}

- (void)undoAction
{
    if (undoStack.count > 0)
    {
        NSInvocation *undoAction = [undoStack lastObject];
        [undoStack removeLastObject];
        [undoAction invoke];
    }
    
    if( undoStack.count == 0)
    {
        [toolbar.items[0] setEnabled:NO];
    }
}

- (NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller
{
    return currentAlbumIndex;
}

- (void)showDataForAlbumAtIndex:(NSInteger)albumIndex
{
    if(albumIndex < allAlbums.count)
    {
        Album *album = allAlbums[albumIndex];
        
        currentAlbumData = [album tr_tableRepresentation];
    }
    else
    {
        currentAlbumData = nil;
    }
    
    [dataTable reloadData];
}

- (void)reloadScroller
{
    allAlbums = [[LibraryAPI sharedInstance] getAlbums];
    
    if( currentAlbumIndex < 0) currentAlbumIndex = 0;
    else if(currentAlbumIndex >= allAlbums.count) currentAlbumIndex = (int)allAlbums.count - 1;
    
    [scroller reload];
    
    [self showDataForAlbumAtIndex:currentAlbumIndex];
}

#pragma mark - HorizontalScrollerDelegate Methods
- (void)horizontalScroller:(HorizontalScroller *)scroller clickedVIewAtIndex:(int)index
{
    currentAlbumIndex = index;
    [self showDataForAlbumAtIndex:index];
}

- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller *)scroller
{
    return allAlbums.count;
}

- (UIView *)horizontalScroller:(HorizontalScroller *)scroller viewAtIndex:(int)index
{
    Album  *album = allAlbums[index];
    
    return [[AlbumView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) albumCover:album.coverUrl];
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [currentAlbumData[@"titles"] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = currentAlbumData[@"titles"][indexPath.row];
    cell.detailTextLabel.text = currentAlbumData[@"values"][indexPath.row];
    
    return cell;
}

- (void)saveCurrentState
{
    [[NSUserDefaults standardUserDefaults] setInteger:currentAlbumIndex forKey:@"currentAlbumIndex"];
    
    [[LibraryAPI sharedInstance] saveAlbums];
}

- (void)loadPreviousState
{
    currentAlbumIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentAlbumIndex"];
    [self showDataForAlbumAtIndex:currentAlbumIndex];
}
@end
