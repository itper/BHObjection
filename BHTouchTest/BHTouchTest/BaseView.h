//
//  BaseView.h
//  BHTouchTest
//
//  Created by chendi on 15/8/4.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

-(UIView *)test:(CGPoint)point withEvent:(UIEvent *)event;
-(BOOL)testpointInside:(CGPoint)point withEvent:(UIEvent *)event;
@end
