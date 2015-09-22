//
//  BHCircleCollectionViewController.m
//  BHCollectionView
//
//  Created by chendi on 15/9/16.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "BHCircleCollectionViewController.h"
#import "BHUICommonUtil.h"

@interface BHCircleCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,assign)NSInteger cellCount;
@end

@implementation BHCircleCollectionViewController



-(void)viewDidLoad{
    self.cellCount = 0;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"123"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.userInteractionEnabled = NO;
//    [self createView];
//    [self.collectionView reloadData];
}
-(void)viewDidAppear:(BOOL)animated{
    [self createView];
}
-(NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cellCount;
}
-(void)createView{
    static NSInteger i = 0;
    i++;
    if(i>126)return;
    [self performSelector:@selector(createView) withObject:nil afterDelay:1.0f/9.0f];
    [self touchesBegan:[NSSet setWithArray:@[[UITouch new]]] withEvent:nil];
    
}
-(nonnull UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    cell.contentView.layer.cornerRadius = 50;
    cell.contentView.layer.borderWidth = 1;
    cell.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.contentView.backgroundColor = [UIColor blueColor];
    return cell;
}
-(void)touchesBegan:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    if([touches.anyObject locationInView:self.view].y<BH_SCREEN_HEIGHT/2){
        
        self.cellCount+=1;
        [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
    }else{
        self.cellCount-=1;
        if(self.cellCount<0){
            self.cellCount=0;
        }else
        [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]     ]];
    }
}
@end
