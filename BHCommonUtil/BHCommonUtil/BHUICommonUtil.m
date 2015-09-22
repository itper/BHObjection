//
//  BHUICommonUtil.m
//  BHCommonUtil
//
//  Created by chendi on 15/7/27.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHUICommonUtil.h"

@implementation BHUIButton

-(void)dealloc{
    NSLog(@"bh button alloc");
}

@end

@implementation BHUICommonUtil

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */
+(UIButton*)createATestButton:(NSString*)title frame:(CGRect)frame action:(SEL)selector owner:(NSObject*)owner{
    BHUIButton *button = [BHUIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:owner action:selector forControlEvents:UIControlEventTouchUpInside];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}


+(UIButton *)createATestButton:(NSString *)title frame:(CGRect)frame action:(SEL)selector owner:(NSObject *)owner onCreate:(onCreate)callback{
    UIButton *button = [BHUICommonUtil createATestButton:title frame:frame action:selector owner:owner];
    callback(button);
    return button;
}
+(NSString *)appendString:(NSString *)str1 otherString:(NSString *)otherString splitChar:(NSString*)split{
    return [NSString stringWithFormat:@"%@%@%@%@",str1,split,otherString,split];
}
+(CGRect)changeValue:(NSDictionary*)keyValue origin:(CGRect)rect{
    CGRect rect1 = rect;
    for (NSString * str in keyValue.allKeys) {
        if(str.length>0){
            CGFloat value =  [[keyValue objectForKey:str] floatValue];
            if([@"x" isEqualToString:str]){
                rect1.origin.x = value;
            }else if([@"y" isEqualToString:str]){
                rect1.origin.y = value;
            }else if([@"w" isEqualToString:str]){
                rect1.size.width = value;
            }else if([@"h" isEqualToString:str]){
                rect1.size.height = value;
            }
        }
    }
    return rect1;
}
@end
