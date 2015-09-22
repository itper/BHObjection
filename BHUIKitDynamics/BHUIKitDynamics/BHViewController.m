//
//  ViewController.m
//  BHUIKitDynamics
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHViewController.h"

@interface BHViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray *controllers;
@end

@implementation BHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIKit Dynamics";
    self.controllers = @[@{@"type":@"gravity"}];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controllers.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    cell.textLabel.text = [self.controllers[indexPath.row] objectForKey:@"type"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller = [[BHDetailViewController alloc] initWithData:self.controllers[indexPath.row]];
    
    [self.navigationController pushViewController:controller animated:YES];
}
@end
