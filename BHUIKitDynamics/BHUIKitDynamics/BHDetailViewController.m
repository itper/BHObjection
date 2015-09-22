//
//  BHDetailViewController.m
//  BHUIKitDynamics
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHDetailViewController.h"

@interface BHDetailViewController()
@property (nonatomic,strong)NSDictionary *data;
@property (nonatomic,strong)UIDynamicAnimator *animator;
@end

@implementation BHDetailViewController



-(instancetype)initWithData:(NSDictionary*)data{
    self = [super init];
    self.data = data;
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = [self.data objectForKey:@"type"];
    [self initDynamics];
}
-(void)initDynamics{
    UIView *obj = [self createAnObject:CGRectMake(20, 0, 100, 100) backgroundColor:[UIColor blueColor]];
    UIView *container = [self createAnObject:CGRectMake(30, 100, 300, 300) backgroundColor:[UIColor whiteColor]];
    [container addSubview:obj];
    [self.view addSubview:container];
    obj.transform = CGAffineTransformRotate(obj.transform, 50);
    container.transform = CGAffineTransformRotate(container.transform, 100);
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:container];
    UIGravityBehavior *behavior = [[UIGravityBehavior alloc] initWithItems:@[obj]];
    UICollisionBehavior *behavior1 = [[UICollisionBehavior alloc]    initWithItems:@[obj]];
    behavior1.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:behavior1];
    [animator addBehavior:behavior];
    self.animator = animator;
}
-(UIView*)createAnObject:(CGRect)rect backgroundColor:(UIColor *)bgColor{
    UIView *obj = [[UIView alloc] initWithFrame:rect];
    obj.backgroundColor = bgColor;
    return obj;
}
@end
