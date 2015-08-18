//
//  TestViewController.m
//  MemoryManagement
//
//  Created by chendi on 15/7/29.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "TestViewController.h"
#import "BHUICommonUtil.h"
#import "BHBlockTest.h"

@interface TestViewController ()<BHBlockTestDelegate>
@property (nonatomic,retain)BHBlockTest *test;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@" view did load");
    //    // Do any additional setup after loading the view.
    UIButton *button = [BHUICommonUtil createATestButton:@"返回" frame:CGRectMake(100, 100, 100, 100) action:@selector(onClick:) owner:self];
    [self.view addSubview:button];
    
    self.test = [[BHBlockTest alloc] init];
    self.test.delegate = self;
    [self.test request];
}
-(void)onClick:(UIButton*)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)finish{
//    NSLog(@"%@",self.description);
}
-(void)requestFinish{
    NSLog(@" set nil");
    self.test = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
