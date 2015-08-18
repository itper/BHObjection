//
//  ViewController.m
//  BHDisplayLinkTest
//
//  Created by chendi on 15/8/4.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,retain)UIView *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.testView];
    //timestamp时间戳,上一帧的时间戳，用的是CoreAnimation使用的时间格式
    //CFTimeInterval localLayerTime = [myLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    //duration，耗时，当帧率达到60时，该值就是1/60，动态的值，在真循环selector中可以使用
    //frameInterval帧间隔，默认1，意思就是每帧都调用
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",@"ontouch");
}

-(void)update:(CADisplayLink *)link{
    NSLog(@"%@,%@,%@,%@",@(link.timestamp),@(link.duration),@(link.frameInterval),@(1.0f/60.0f));
    CGRect frame  = self.testView.frame;
    frame.origin.x+=1;
    self.testView.frame = frame;
    NSLog(@"%@,%@,%@,%@",@(link.timestamp),@(link.duration),@(link.frameInterval),@(1.0f/60.0f));
}

@end
