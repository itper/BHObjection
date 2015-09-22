//
//  BHButtonTestCategory.m
//  BHCommonUtil
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHButtonTestCategory+UIButton.h"

@implementation UIButton(BHButtonTestCategory)


-(void)changeSelf{
    static BOOL isFristChange = NO;
    NSString *title = self.titleLabel.text;
    static NSInteger times = 0;
    if(isFristChange){
        title = [title substringToIndex:(title.length-5-[@((times==0?0:times-1)) description].length)];
    }
    NSLog(@"%@",@(times).description);
    [self setTitle:[NSString stringWithFormat:@"%@的点击第%@次",title,@(times)] forState:UIControlStateNormal];
    [self setTitle:[NSString stringWithFormat:@"%@的点击第%@次",title,@(times)] forState:UIControlStateHighlighted];
    
    times ++;
    isFristChange = YES;
}
@end
//如果是categor,category作为运行时特性,编译时不进行链接,加上全局函数,强制链接.
void import_Category_Compression ( ) { }