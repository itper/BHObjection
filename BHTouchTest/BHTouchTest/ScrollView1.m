//
//  ScrollView1.m
//  BHTouchTest
//
//  Created by chendi on 15/8/5.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ScrollView1.h"

@implementation ScrollView1

-(BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view{
    NSLog(@"%@",@"touchs should begin");
//    return [super touchesShouldBegin:touches withEvent:event inContentView:view];
    return  YES ;
}
-(BOOL)touchesShouldCancelInContentView:(UIView *)view{
    NSLog(@"touch cancel in content view");
//    return [super touchesShouldCancelInContentView:view];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"next responder %@",self.nextResponder);
    NSLog(@"...on touch began");
}
@end
