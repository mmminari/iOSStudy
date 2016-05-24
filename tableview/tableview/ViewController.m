//
//  ViewController.m
//  tableview
//
//  Created by 김민아 on 2016. 5. 19..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *arr;
@property (weak, nonatomic) IBOutlet UIImageView *iv;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.arr = @[@"a", @"b", @"c"];
    self.iv.backgroundColor = [self getColorWithRGBCode:@"eeeeee"];
    
    
}
-(UIColor *)getColorWithRGBCode:(NSString *)code
{
    UIColor *color = nil;
    
    NSMutableDictionary *rgbDictionary = [[NSMutableDictionary alloc]init];
    [rgbDictionary setObject:[code substringWithRange:NSMakeRange(0, 2)] forKey:@"Red"];
    [rgbDictionary setObject:[code substringWithRange:NSMakeRange(2, 2)] forKey:@"Green"];
    [rgbDictionary setObject:[code substringWithRange:NSMakeRange(4, 2)] forKey:@"Blue"];
    
    NSInteger totalValue = 0;
    CGFloat finalColorValue = 0;
    
    for (NSString *colorKey in rgbDictionary.allKeys)
    {
        NSString *colorValue = [rgbDictionary objectForKey:colorKey];
        NSString *color = nil;
        
        for(int i = 0; i<[colorValue length];i++)
        {
            
            color = [colorValue substringWithRange:NSMakeRange(i, 1)];
            
            if([color isEqualToString:@"a"])
                color = @"10";
            else if([color isEqualToString:@"b"])
                color = @"11";
            else if([color isEqualToString:@"c"])
                color = @"12";
            else if([color isEqualToString:@"d"])
                color = @"13";
            else if([color isEqualToString:@"e"])
                color = @"14";
            else if([color isEqualToString:@"f"])
                color = @"15";
            
            if (i == 0) {
                totalValue += color.integerValue * 16;
            }else
            {
                totalValue += color.integerValue;
            }
        }
        
        finalColorValue = totalValue / 255.0f;
        
        [rgbDictionary setObject:[NSNumber numberWithFloat:finalColorValue] forKey:colorKey];
        
        finalColorValue = 0.0f;
        totalValue = 0.0f;
        
    }
    
    color = [UIColor colorWithRed:[[rgbDictionary valueForKey:@"Red"] floatValue]
                            green:[[rgbDictionary valueForKey:@"Green"] floatValue]
                             blue:[[rgbDictionary valueForKey:@"Blue"] floatValue] alpha:1];
    
    return color;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"row");
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                            forIndexPath:indexPath];
    NSLog(@"hi");
    
    
    return cell;
    
}


@end
