//
//  ViewController.m
//  BHTouchTest
//
//  Created by chendi on 15/8/4.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "View1.h"
#import "View2.h"
#import "View3.h"
#import "View4.h"
#import "ScrollView1.h"

@interface ViewController ()
@property (nonatomic,retain)View1 *view1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view1 = [[View1 alloc]   initWithFrame:CGRectMake(0, 0, 300, self.view.frame.size.height*2)];
    View2 *view2 =  [[View2 alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    View3 *view3 = [[View3 alloc]    initWithFrame:CGRectMake(0, 0, 50, 50)];
    View4 *view4 = [[View4 alloc] initWithFrame:CGRectMake(100, 0, 100, 100)];
    
    [self.view1 addSubview:view2];
    [self.view1 addSubview:view4];
    [view2 addSubview:view3];
    ScrollView1 *scrollView = [[ScrollView1 alloc] initWithFrame:self.view.frame];
    [scrollView addSubview:self.view1];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    // Do any additional setup after loading the view, typically from a nib.
//    [self hitTest1];
}




//模拟系统的hitTest
//测试自定的hitTest和pointInSide
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    CGPoint point  = [touch locationInView:[[UIApplication sharedApplication].delegate window]];
//    
//    
//    UIView *view = [self.view1 test:point withEvent:event];
//    NSLog(@"%@",NSStringFromCGPoint(point));
//    NSLog(@"%@ view",view);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
