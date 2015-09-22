//
//  BHBasicView.m
//  BHMasonry
//
//  Created by chendi on 15/9/21.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "BHBasicView.h"
#import <UIKit/UIKit.h>
#import "Masonry.h"

@implementation BHBasicView

-(id)init{
    self = [super init];
    if(!self)return nil;
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    [self addSubview:greenView];
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self addSubview:redView];
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [self addSubview:blueView];
    redView.layer.borderColor = blueView.layer.borderColor = greenView.layer.borderColor = [UIColor blackColor].CGColor;
    redView.layer.borderWidth = blueView.layer.borderWidth = greenView.layer.borderWidth = 2;
    
    UIView *superview = self;
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superview.top).offset(10);
        make.left.equalTo(superview.left).offset(10);
        make.bottom.equalTo(superview.bottom).offset(-10);
        make.right.equalTo(superview.right).offset(-10);
    }];
    
    
    return self;
}
@end
