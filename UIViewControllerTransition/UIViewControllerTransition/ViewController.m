//
//  ViewController.m
//  UIViewControllerTransition
//
//  Created by chendi on 15/7/27.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "BHUICommonUtil.h"

@interface ViewController ()
@property (nonatomic,copy)NSString *testStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [BHUICommonUtil createATestButton:@"test" frame:CGRectMake(100, 100, 100, 100) action:@selector(onClick:) owner:self];
    [self.view addSubview:button];
    NSMutableString *str = [NSMutableString stringWithString:@"123"];
    NSString *str2 = [str copy];
    [str appendString:@"123"];
    NSLog(@"%@,%@",str,str2);
    self.testStr = str;
    [str appendString:@"aaa"];
    NSLog(@"test:%@,str:%@",self.testStr,str);
    @property(strong)NSString *testStr;
    NSMutableString *str = @"123";
    self.testStr = str;
    [str appendString:@"123"];
    NSLog(self.testStr,str);
}
-(void)onClick:(UIButton*)button{
    NSLog(@"click");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
