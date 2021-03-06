//
//  ImageDownload.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 18..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ImageDownload.h"

@interface ImageDownload ()

@end


@implementation ImageDownload

-(void)stardDownload
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    NSLog(@"imgdownurl : %@", self.urlString);
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *datatask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                              UIImage *image = [[UIImage alloc]initWithData:data];
                                              
                                              if(image!= nil)
                                              {
                                                  [self.imageArr addObject:image];
                                                  NSLog(@"image arr : %zd", self.imageArr.count);
                                              }
                                              
                                              if (self.completionHandler != nil)
                                              {
                                                  self.completionHandler();
                                              }
                                              
                                          }];
                                          
                                      }];
    
    [datatask resume];
    
}

@end
