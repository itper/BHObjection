//
//  BHCommonUtilTestController.m
//  BHCommonUtil
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHCommonUtilTestController.h"
#import "BHUICommonUtil.h"
#import "BHButtonTestCategory+UIButton.h"

@implementation BHCommonUtilTestController
-(void)viewDidLoad{
    [super viewDidLoad];
    [BHUICommonUtil createATestButton:@"从a库关闭controller" frame:CGRectMake(0, 100,BH_SCREEN_WIDTH, 100) action:@selector(onClick:) owner:self onCreate:^(UIButton *button) {
        [self.view addSubview:button];
        button.tag = 1;
    }];
    [BHUICommonUtil createATestButton:@"测试a库category" frame:CGRectMake(0, 200,BH_SCREEN_WIDTH, 100) action:@selector(onClick:) owner:self onCreate:^(UIButton *button) {
        [self.view addSubview:button];
        button.tag = 2;
    }];
    import_Category_Compression();
}
-(void)onClick:(UIButton*)button{
    if(button.tag == 1){
        
        if(self.navigationController){
            [self popoverPresentationController];
        }else{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else{
        
        [button changeSelf];
    }
}
@end
