//
//  LibraryAPI.m
//  NavigationController
//
//  Created by 김민아 on 2016. 10. 10..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "LibraryAPI.h"
#import "PersistencyManager.h"
#import "HTTPClient.h"

@interface LibraryAPI(){
    PersistencyManager *persistencyManager;
    HTTPClient *httpClient;
    BOOL isOnLine; // is needed to update album
}

@end

@implementation LibraryAPI

+ (LibraryAPI *)sharedInstance
{
    static LibraryAPI *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc]init];
        
    });
    
    return _sharedInstance;
    
}

- (id)init
{
    self = [super init];
    
    if(self)
    {
        persistencyManager = [[PersistencyManager alloc]init];
        httpClient = [[HTTPClient alloc]init];
        isOnLine = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadImage:) name:@"BLDownloadImageNotification" object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSArray *)getAlbums
{
    return [persistencyManager getAlbums];
}

- (void)addAlbum:(Album *)album atIndex:(NSInteger)index
{
    [persistencyManager adddAlbum:album atIndex:index];
    if(isOnLine)
    {
        //[httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)downloadImage:(NSNotification *)notification
{
    
    /*
    UIImageView *imageView = notification.userInfo[@"imageView"];
    NSString *coverUrl = notification.userInfo[@"coverUrl"];
    
    imageView.image = [persistencyManager getImage:[coverUrl lastPathComponent]];
    
    if(imageView.image == nil)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //UIImage *image = [httpClient downloadImage:coverUrl];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
               // imageView.image = image;
               // [persistencyManager saveImage:image filename:[coverUrl lastPathComponent]];
            });
        });
    }
     
     */
    
}

- (void)deleteAlbumAtIndex:(NSInteger)index
{
    
}

- (void)saveAlbums
{
    [persistencyManager saveAlbums];
}
@end
