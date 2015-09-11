//
//  ViewController.m
//  BHCoreText
//
//  Created by chendi on 15/8/7.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CTView *view = [[CTView alloc] init];
    
    view.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:view];
    view.backgroundColor = [UIColor yellowColor]    ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
