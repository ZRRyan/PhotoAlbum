//
//  ZRImageCell.m
//  UICollectionView的用法
//
//  Created by Ryan on 15/10/9.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "ZRImageCell.h"

@interface ZRImageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZRImageCell

- (void)awakeFromNib {
    
    self.imageView.layer.borderWidth = 1;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 10;
    self.imageView.clipsToBounds = YES;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    [_imageView setImage:[UIImage imageNamed:imageName]];
}

@end
