//
//  BHUICommonUtil.h
//  BHCommonUtil
//
//  Created by chendi on 15/7/27.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BH_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define BH_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define BH_SCREEN_SIZE [UIScreen mainScreen].bounds

typedef void(^onClick)(UIButton *button,NSInteger tag);
typedef void(^onCreate) (UIButton *button);
@interface BHUICommonUtil : UIView

+(UIButton*)createATestButton:(NSString*)title frame:(CGRect)frame action:(SEL)selector owner:(NSObject*)owner;
+(UIButton*)createATestButton:(NSString*)title frame:(CGRect)frame action:(SEL)selector owner:(NSObject*)owner onCreate:(onCreate)callback;
+(NSString*)appendString:(NSString*)str1 otherString:(NSString*)otherString splitChar:(NSString*)split;
+(CGRect)changeValue:(NSDictionary *)keyValue origin:(CGRect)rect;
@end

@interface BHUIButton : UIButton

@end