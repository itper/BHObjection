//
//  ViewController.m
//  BHMasonry
//
//  Created by chendi on 15/9/18.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "BHBasicView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
-(void)loadView{
    self.view = [BHBasicView new];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
