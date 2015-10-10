//
//  ViewController.m
//  BHTestSelector(如何引用的)
//
//  Created by chendi on 15/9/25.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"


@interface TestSelector : NSObject
-(void)test;
@end
@implementation TestSelector

-(void)test{
    NSLog(@"invoke:%@",self);
}
-(void)dealloc{
    NSLog(@"test selector dealloc ");
}
@end

@interface ViewController ()
@property (nonatomic,assign)SEL sel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //得到一个函数结构,不是一个函数指针,和函数本身无关.
    self->_sel = NSSelectorFromString(@"test");
    TestSelector *test = [TestSelector new];
    //编译器不能确定以何种方式来在编译期间插入合适的release和retain等方法.arc采用的方式就是什么都不多,所以有警告,可能会引起内存泄露.
    [test performSelector:self->_sel];
    
    [UIView new];
    [UIView new];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
