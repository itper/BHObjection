//
//  BHStackCollectionViewController.m
//  BHCollectionView
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHStackCollectionViewController.h"

@interface BHStackCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end


@implementation BHStackCollectionViewController


- (id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
    {
        // make sure we know about our cell prototype so dequeueReusableCellWithReuseIdentifier can work
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"123"];
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 24;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithHue:((CGFloat)indexPath.item)/24 saturation:1.0 brightness:1.0 alpha:1.0];
    NSLog(@"p:%@",@(indexPath.item));
    return cell;
}
@end
