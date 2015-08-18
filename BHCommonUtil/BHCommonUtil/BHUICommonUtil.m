//
//  BHUICommonUtil.m
//  BHCommonUtil
//
//  Created by chendi on 15/7/27.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHUICommonUtil.h"

@implementation BHUICommonUtil

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */
+(UIButton*)createATestButton:(NSString*)title frame:(CGRect)frame action:(SEL)selector owner:(NSObject*)owner{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:owner action:selector forControlEvents:UIControlEventTouchUpInside];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}

@end
