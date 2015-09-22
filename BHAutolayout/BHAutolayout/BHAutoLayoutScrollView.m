//
//  BHAutoLayoutScrollView.m
//  BHAutolayout
//
//  Created by chendi on 15/9/18.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "BHAutoLayoutScrollView.h"
#import "BHUICommonUtil.h"

@implementation BHAutoLayoutScrollView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.text.text = [BHUICommonUtil appendString:self.text.text otherString:@"hello hello hello hello hello hello hello hello" splitChar:@"\n"];
}
@end
