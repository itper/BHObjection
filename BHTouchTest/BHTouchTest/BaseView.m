//
//  BaseView.m
//  BHTouchTest
//
//  Created by chendi on 15/8/4.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BaseView.h"

#define NEEN_CALL_SUPER YES
#define TEST_HIT_TEST NO
@implementation BaseView

-(id)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    NSString *str = NSStringFromClass(self.class);
    if([str isEqualToString:@"View1"]){
        self.backgroundColor = [UIColor blueColor];
    }else if([str isEqualToString:@"View2"]){
        self.backgroundColor = [UIColor yellowColor];
    }else if([str isEqualToString:@"View3"]){
        self.backgroundColor = [UIColor greenColor];
    }else if([str isEqualToString:@"View4"]){
        self.backgroundColor = [UIColor grayColor];
    }
    frame.origin.x = frame.origin.y = 0;
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.adjustsFontSizeToFitWidth = YES;
    label.text = str;
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled = NO;
    [self addSubview:label];
    if(TEST_HIT_TEST)self.userInteractionEnabled = NO;
    return self;
}
-(NSString *)description{
    return NSStringFromClass(self.class);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(NEEN_CALL_SUPER)[super touchesBegan:touches withEvent:event];
    NSLog(@"%@ began",self);
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    if(NEEN_CALL_SUPER)[super touchesCancelled:touches withEvent:event];
    NSLog(@"%@ cancelled",self);
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(NEEN_CALL_SUPER)[super touchesEnded:touches withEvent:event];
    NSLog(@"%@ ended",self);
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if(NEEN_CALL_SUPER)[super touchesMoved:touches withEvent:event];
    NSLog(@"%@ move",self);
}


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%@ hittest start get",self);
    UIView *view =  [super hitTest:point withEvent:event];
    NSLog(@"%@ hittest end get %@",self,view);
    return view;
}
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    NSLog(@"%@ point start inside",self);
    BOOL su =  [super pointInside:point withEvent:event];
//    NSLog(@"%@ point end inside %@",self,@(su));
    return su;
    }



//父类方法，判断当前的view和他的所有子view包含point，当当前view包含该point，遍历他的子view
//所有的view继承了该方法，每个view都可以遍历自己的子view，一直到最底层的view
-(UIView *)test:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view1 = nil;
    //在当前view包含point的情况下，遍历自己的所有子view
    
    if([self testpointInside:point withEvent:event]){
        for (BaseView *view in self.subviews) {
            if(![view isKindOfClass:BaseView.class])continue;
            view1 = [view test:point withEvent:event];
            if(view1)break;
        }
        if(view1 == nil)view1 = self;
    }
    
    NSLog(@"end  test %@",self);
    return view1;
}
//将该方法单独出来，可以手动重写来设置view是否应该响应
-(BOOL)testpointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGPoint point1 = [self convertPoint:point fromView:[[UIApplication sharedApplication].delegate window]];
    BOOL yesOrNo =  (CGRectContainsPoint(self.bounds, point1));
//    NSLog(@"%@ in point point:%@,rect%@,yesOrNo:%@",self,NSStringFromCGPoint(point1),NSStringFromCGRect(self.bounds),@(yesOrNo));
    return yesOrNo;
    
}

@end
