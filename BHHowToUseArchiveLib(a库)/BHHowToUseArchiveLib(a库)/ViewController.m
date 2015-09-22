//
//  ViewController.m
//  BHHowToUseArchiveLib(a库)
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "BHUICommonUtil.h"
#import "BHCommonUtilTestController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, BH_SCREEN_WIDTH, 300)];
    label.numberOfLines = 0;
    label.text = @"配置User header search Paths:$(PROJECT_DIR)/../BHCommonUtil";
    [self.view addSubview:label];
    [BHUICommonUtil createATestButton:@"a库工具类创建的按钮" frame:CGRectMake(0,100,BH_SCREEN_WIDTH,100) action:@selector(onClick:) owner:self onCreate:^(UIButton *button) {
        [self.view addSubview:button];
        button.tag = 1;
    }];
    [BHUICommonUtil createATestButton:@"打开库中的controller" frame:CGRectMake(0,300,BH_SCREEN_WIDTH,100) action:@selector(onClick:) owner:self onCreate:^(UIButton *button) {
        [self.view addSubview:button];
        button.tag = 2;
    }];
}
-(void)onClick:(UIButton*)button{
    if(button.tag == 1){
        
        static NSInteger times = 0;
        button.titleLabel.text = [NSString stringWithFormat:@"第%ld次点击",times];
        [button setTitle:button.titleLabel.text forState:UIControlStateHighlighted];
        [button setTitle:button.titleLabel.text forState:UIControlStateNormal];
        times++;
    }else{
        [self presentViewController:[BHCommonUtilTestController new] animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
