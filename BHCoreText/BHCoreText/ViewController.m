//
//  ViewController.m
//  BHCoreText
//
//  Created by chendi on 15/8/7.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "BHView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BHView *view = [[BHView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
}

@end
