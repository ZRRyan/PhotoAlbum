

//
//  ZRLineLayout.m
//  UICollectionView的用法
//
//  Created by Ryan on 15/10/10.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "ZRLineLayout.h"

static const CGFloat itemW = 100;

@implementation ZRLineLayout

- (instancetype)init
{
    if (self = [super init]) {
           }
    return self;
}

/** 一些初始化操作在这里实现 */
- (void)prepareLayout
{
    [super prepareLayout];
    // 每个cell的尺寸
    self.itemSize = CGSizeMake(itemW, itemW);
    // 设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat inset = (self.collectionView.frame.size.width - itemW) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    // 设置每行间距
    self.minimumLineSpacing = itemW;

}

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGRect lastRect;
    lastRect.origin = proposedContentOffset;
    lastRect.size = self.collectionView.frame.size;
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    NSArray *array = [self layoutAttributesForElementsInRect:lastRect];
    
    CGFloat adjustOffSetX = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *att in array) {

        if (ABS(att.center.x - centerX) < ABS(adjustOffSetX)) {
            adjustOffSetX = att.center.x - centerX;
        }
    }
    return  CGPointMake(proposedContentOffset.x + adjustOffSetX, proposedContentOffset.y);
 }

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    CGRect visibleRect ;
    visibleRect.size = self.collectionView.frame.size;
    visibleRect.origin = self.collectionView.contentOffset;
    
   
    
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    NSArray * array = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attribute in array) {
        if (!CGRectIntersectsRect(visibleRect, attribute.frame)) continue;
        
        CGFloat itemCenterX = attribute.center.x;
        
        CGFloat scale = 1 + 0.5*(1 - ABS(itemCenterX - centerX) / (self.collectionView.frame.size.width * 0.5));
        attribute.transform3D = CATransform3DMakeScale(scale, scale , 1.0);
        
        attribute.alpha = 1-ABS(itemCenterX - centerX) / (self.collectionView.frame.size.width * 0.5);
        
}
    
    
    return array;
}

@end
