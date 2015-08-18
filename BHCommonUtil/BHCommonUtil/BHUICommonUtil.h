//
//  BHUICommonUtil.h
//  BHCommonUtil
//
//  Created by chendi on 15/7/27.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^onClick)(UIButton *button,NSInteger tag);

@interface BHUICommonUtil : UIView

+(UIButton*)createATestButton:(NSString*)title frame:(CGRect)frame action:(SEL)selector owner:(NSObject*)owner;
@end
