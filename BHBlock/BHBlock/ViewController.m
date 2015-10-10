//
//  ViewController.m
//  BHBlock
//
//  Created by chendi on 15/10/4.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"

typedef void(^Test)();
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    __block NSInteger i = 1;//在js中的闭包,对这样的基础类型不会发生拷贝,相当于加了__block,在闭包捕获到变量之后,在之外改变变量,变量不管是不是数值类型,闭包中的变量都会受影响的.
    NSInteger i;
    i = 0;
    Test t = ^{
        NSLog(@"block value %d",i);
//        i = 10;
    };
    i = 3;
    NSLog(@"%d",i);
    t();
    NSLog(@"%d",i);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
