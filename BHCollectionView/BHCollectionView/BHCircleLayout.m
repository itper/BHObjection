//
//  BHCircleLayout.m
//  BHCollectionView
//
//  Created by chendi on 15/9/16.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "BHCircleLayout.h"

@implementation BHCircleLayout

-(void)prepareLayout{
    [super prepareLayout];
}
-(nullable NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes = [NSMutableArray array];
    for(NSInteger i = 0;i<[self.collectionView numberOfItemsInSection:0];i++){
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    return attributes;
}
//重写该方法,自己调用.
-(nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attribute.size = CGSizeMake(100, 100);
    CGPoint viewCenter = CGPointMake(self.collectionView.bounds.size.width/2, self.collectionView.bounds.size.height/2);
    CGFloat radius = MIN(self.collectionView.bounds.size.width/2, self.collectionView.bounds.size.height/2)-attribute.size.width/2;
    CGFloat angle = 2*M_PI*indexPath.item/[self.collectionView numberOfItemsInSection:0];
    CGFloat x = viewCenter.x+radius*cosf(angle);
    CGFloat y = viewCenter.y+radius*sinf(angle);
    attribute.center = CGPointMake(x, y);
    return attribute;
}
@end
