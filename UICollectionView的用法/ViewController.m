//
//  ViewController.m
//  UICollectionView的用法
//
//  Created by Ryan on 15/10/9.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "ViewController.h"
#import "ZRImageCell.h"
#import "ZRLineLayout.h"
#import "ZRStaticLayout.h"

#import "ZRCircleLayout.h"

#define CellID @"cellID"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray *images;
@property (weak, nonatomic) UICollectionView  *collectionView;
@end

@implementation ViewController

- (NSMutableArray *)images
{
    if (!_images) {
        self.images = [NSMutableArray array];
        for (int i = 1; i <= 20; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    CGFloat w = self.view.frame.size.width;
    CGRect rect = CGRectMake(0, 100, w, 200 );
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[ZRStaticLayout alloc] init]];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    [collectionView registerNib:[UINib nibWithNibName:@"ZRImageCell" bundle:nil] forCellWithReuseIdentifier:CellID];
    
    self.collectionView = collectionView;
}

#define mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZRImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    cell.imageName = self.images[indexPath.item];
    
    
    return cell;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[ZRStaticLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[ZRCircleLayout alloc] init] animated:YES];
    }
    else
    {
        [self.collectionView setCollectionViewLayout:[[ZRStaticLayout alloc] init] animated:YES];
    }
}


-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.images removeObjectAtIndex:indexPath.item];
//    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
    if (![self.collectionView.collectionViewLayout isKindOfClass:[ZRLineLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[ZRLineLayout alloc] init] animated:YES];
    }
}

@end
