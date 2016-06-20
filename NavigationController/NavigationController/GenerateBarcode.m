//
//  GenerateBarcode.m
//  NavigationController
//
//  Created by 김민아 on 2016. 6. 20..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "GenerateBarcode.h"
#import <ZXingObjC/ZXMultiFormatWriter.h>
#import <ZXingObjC/ZXBitMatrix.h>
#import <ZXingObjC/ZXImage.h>

#define DefaultBarcodeSize                 CGSizeMake(300.0f, 1000.0f)


@interface GenerateBarcode ()

@property (strong, nonatomic) NSString *barCode;
@property (assign, nonatomic) CGSize barcodeSize;

@end

@implementation GenerateBarcode


-(instancetype)initWithBarcode:(NSString *)barcode
{
    if(self = [super init])
    {
        _barCode = barcode;
        _barcodeSize = DefaultBarcodeSize;
    }
    
    return self;
    
}

- (UIImage *)generateVerticalBarcodeImage
{
    UIImage *img = [self generateBarcodeImage];
    
    if(img)
    {
        img = [UIImage imageWithCGImage:img.CGImage scale:1.0f orientation:UIImageOrientationLeft];
    }
    else
    {
        img = nil;
    }
    
    return img;
}


-(UIImage *)generateBarcodeImage
{
    NSError *error = nil;
    
    UIImage *barcodeImg= nil;
    
    int minWidth = 1;
    
    ZXMultiFormatWriter *writer = [ZXMultiFormatWriter writer];
    ZXBitMatrix *result = [writer encode:self.barCode format:kBarcodeFormatCode128 width:minWidth height:self.barcodeSize.height error:&error];
    
    if(result)
    {
        ZXImage *image = [ZXImage imageWithMatrix:result];
        barcodeImg = [UIImage imageWithCGImage:image.cgimage];
        
    }
    else
    {
        barcodeImg = nil;
    }
    
    return barcodeImg;

}


@end
