//
//  GenerateBarcode.h
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface GenerateBarcode : NSObject

-(instancetype)initWithBarcode:(NSString *)barcode;
-(UIImage *)generateBarcodeImage;
-(UIImage *)generateVerticalBarcodeImage;




@end
