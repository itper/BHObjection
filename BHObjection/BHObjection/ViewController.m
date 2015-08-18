//
//  ViewController.m
//  BHObjection
//
//  Created by chendi on 15/8/18.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "JSObjection.h"
#import "ViewControllerAProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    UIViewController<ViewControllerAProtocol> *vc = [injector getObject:@protocol(ViewControllerAProtocol)];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
