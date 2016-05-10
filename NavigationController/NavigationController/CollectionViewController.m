//
//  CollectionViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 9..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "CollectionViewController.h"
#import "ShowImageView.h"
#import "ButtonView.h"
#import "LabelView.h"
#import "SwitchView.h"

@interface CollectionViewController ()

@property (strong, nonatomic) ShowImageView *imageVC;
@property (strong, nonatomic) ButtonView *buttonVC;
@property (strong, nonatomic) LabelView *labelVC;
@property (strong, nonatomic) SwitchView *swithVC;





@end

@implementation CollectionViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.imageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-showimageview"];
    self.swithVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-switchview"];
    self.labelVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-labelview"];
    self.buttonVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stid-buttonview"];
 
}


                         
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height-64.0f;
    
    return CGSizeMake(width, height);
    
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    // _data is a class member variable that contains one array per section.
    return 1;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellId = @"collectionCell";
    
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId
                                                                                forIndexPath:indexPath];
    
    if(indexPath.item == 0)
    {
        cell.colorView.backgroundColor = [UIColor grayColor];
        
        [cell.contentView addSubview:self.imageVC.view];
        [self setContentViewLayoutWithSubView:self.imageVC.view withTargetView:cell.contentView ];

    }
    if(indexPath.item == 1)
    {
        cell.colorView.backgroundColor = [UIColor purpleColor];
        
        [cell.contentView addSubview:self.swithVC.view];
        [self setContentViewLayoutWithSubView:self.swithVC.view withTargetView:cell.contentView ];
        
    }
    if(indexPath.item == 2)
    {
        cell.colorView.backgroundColor = [UIColor brownColor];
        
        [cell.contentView addSubview:self.labelVC.view];
        [self setContentViewLayoutWithSubView:self.labelVC.view withTargetView:cell.contentView  ];

    }
    if(indexPath.item == 3)
    {
        cell.colorView.backgroundColor = [UIColor magentaColor];
        
        [cell.contentView addSubview:self.buttonVC.view];
        [self setContentViewLayoutWithSubView:self.buttonVC.view  withTargetView:cell.contentView ];
    }

    
    return cell;
}

-(void)setContentViewLayoutWithSubView:(UIView *)subView withTargetView:(UIView *)targetView
{
    subView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *alcTopOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                       attribute:NSLayoutAttributeTop
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:targetView attribute:NSLayoutAttributeTop
                                                                      multiplier:1.0f
                                                                        constant:10.0f];
    
    NSLayoutConstraint *alcBottomOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:targetView attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0f
                                                                        constant:-10.0f];
    
    NSLayoutConstraint *alcLeadingOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                       attribute:NSLayoutAttributeLeading
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:targetView attribute:NSLayoutAttributeLeading
                                                                      multiplier:1.0f
                                                                        constant:10.0f];
    
    NSLayoutConstraint *alcTrailingOfSubView = [NSLayoutConstraint constraintWithItem:subView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:targetView attribute:NSLayoutAttributeTrailing
                                                                      multiplier:1.0f
                                                                        constant:-10.0f];
    
    NSArray *cArr = @[alcTopOfSubView, alcBottomOfSubView, alcLeadingOfSubView, alcTrailingOfSubView];
    
    [targetView addConstraints:cArr];
    
    
    
}


@end
