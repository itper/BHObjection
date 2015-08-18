//
//  ViewController.m
//  MemoryManagement
//
//  Created by chendi on 15/7/29.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "BHUICommonUtil.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [BHUICommonUtil createATestButton:@"go" frame:CGRectMake(100, 100, 100, 100) action:@selector(onClick:) owner:self];
    [self.view addSubview:button];
}
-(void)onClick:(UIButton*)button{
    UIViewController *vc = [TestViewController new];
    vc.view.frame = CGRectMake(0, 0, 300, 300);
    NSLog(@"vc");
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
