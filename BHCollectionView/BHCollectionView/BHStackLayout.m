//
//  BHStackLayout.m
//  BHCollectionView
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHStackLayout.h"

@interface BHStackLayout ()
@property (nonatomic,strong)NSMutableArray *attributesArray;
@end

@implementation BHStackLayout



-(id)init{
    self = [super init];
    if(self !=nil){
        self.attributesArray = [NSMutableArray array];
    }
    return self;
}

// The collection view calls -prepareLayout once at its first layout as the first message to the layout instance.
// The collection view calls -prepareLayout again after layout is invalidated and before requerying the layout information.
// Subclasses should always call super if they override.
-(void)prepareLayout{
    
    srand(50);
    if(self.attributesArray==nil)self.attributesArray = [NSMutableArray array];
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i<itemCount; i++) {
        UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        att.center = CGPointMake(self.collectionView.bounds.size.width/2, 200*i);
        att.size = CGSizeMake(100, 200);
        att.transform = CGAffineTransformMakeRotation((((CGFloat)rand())/RAND_MAX)*(M_1_PI)/1);
        att.zIndex = (itemCount - i);
        if(i>10){
            att.alpha = 0.0;
        }
        [self.attributesArray addObject:att];
    }
}
-(CGSize)collectionViewContentSize{
    return CGSizeMake(300, 3000);
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
// Call -invalidateLayout to indicate that the collection view needs to requery the layout information.
// Subclasses must always call super if they override.
-(void)invalidateLayout{
    [super invalidateLayout];
    self.attributesArray = nil;
}
//往往在比较复杂的布局中,每一个cell都有自己的样式,通过在layoutAttributesForelementsInRect遍历调用
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"layout");
    return self.attributesArray[indexPath.row];
}
//每次都会被调用
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attributesArray;
}
@end
