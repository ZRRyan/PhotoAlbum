

//
//  ZRStaticLayout.m
//  UICollectionView的用法
//
//  Created by Ryan on 15/10/11.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "ZRStaticLayout.h"

#define ZRRandom0_1 arc4random_uniform(100)/100.0

@implementation ZRStaticLayout

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

-(CGSize)collectionViewContentSize
{
    return CGSizeMake(500, 500);
}


-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
     NSArray *angles = @[@0,@(-0.5),@(-0.2),@(0.5),@(0.2)];
    
    UICollectionViewLayoutAttributes * atts = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    NSMutableArray *arrM = [NSMutableArray array];
    atts.size = CGSizeMake(100, 100);
    atts.center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    if (indexPath.item >= 5) {
        atts.hidden = YES;
    }
    else
    {
        atts.transform = CGAffineTransformMakeRotation([angles[indexPath.item] floatValue]);
        atts.zIndex = [self.collectionView numberOfItemsInSection:indexPath.section] - indexPath.item;
    }
    
       return atts;
}


-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
//    NSMutableArray *arrM = [NSMutableArray array];
//    
//    
//    NSArray *angles = @[@0,@(-0.5),@(-0.2),@(0.5),@(0.2)];
//    
//    NSInteger count = [self.collectionView numberOfItemsInSection:0];
//    for (int i = 0; i < count; i ++) {
//        UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
//        att.size = CGSizeMake(100, 100);
//        //        att.center = CGPointMake(arc4random_uniform(self.collectionView.frame.size.width), arc4random_uniform(self.collectionView.frame.size.height));
//        att.center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
//        
//        int direction = i % 2 == 0 ? 1 : -1;
//        
//        //        att.transform = CGAffineTransformMakeRotation(ZRRandom0_1 * M_PI_4 * direction);
//        
//        
//        //        att.transform3D = CATransform3DMakeRotation(arc4random_uniform(M_PI), 1, 1, 1);
//        if (i >= 5) {
//            att.hidden = YES;
//        }
//        else
//        {
//            att.transform = CGAffineTransformMakeRotation([angles[i] floatValue]);
//            att.zIndex = count - i;
//        }
//        [arrM addObject:att];
//    }
//    return arrM;
    NSMutableArray *arrM = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i ++) {
        [arrM addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    return arrM;
}


@end
