
//
//  ZRCircleLayout.m
//  UICollectionView的用法
//
//  Created by Ryan on 15/10/11.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "ZRCircleLayout.h"

#define ZRRandom0_1 arc4random_uniform(100)/100.0

@implementation ZRCircleLayout
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
    atts.size = CGSizeMake(50, 50);

    CGPoint circleCenter = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    CGFloat angleDelta = M_PI *2 / [self.collectionView numberOfItemsInSection:indexPath.section];
    CGFloat angle = angleDelta * indexPath.item;
    CGFloat circleRadius = 70;
    
    
    atts.center = CGPointMake(circleCenter.x+ circleRadius * cosf(angle) , circleCenter.y+ circleRadius * sinf(angle));
    atts.zIndex = [self.collectionView numberOfItemsInSection:indexPath.section] - indexPath.item;
//    atts.transform = CGAffineTransformMakeRotation(ZRRandom0_1 * M_PI_4);
    return atts;
}


-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
       NSMutableArray *arrM = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i ++) {
        [arrM addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    return arrM;
}
@end
