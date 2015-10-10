//
//  ViewController.m
//  BHIMP
//
//  Created by chendi on 15/9/28.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "BHTestObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BHTestObject *obj = [BHTestObject new];
    IMP method1 = [obj methodForSelector:NSSelectorFromString(@"test:")];
//    method1(obj,@selector(test:),@"chendi");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
