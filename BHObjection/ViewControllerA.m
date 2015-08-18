//
//  ViewControllerA.m
//  BHObjection
//
//  Created by chendi on 15/8/18.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewControllerA.h"

@implementation ViewControllerA

-(void)viewDidLoad{
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor yellowColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
