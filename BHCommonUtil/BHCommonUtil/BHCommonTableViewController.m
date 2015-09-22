//
//  BHCommonTableViewController.m
//  BHCommonUtil
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHCommonTableViewController.h"

@interface BHCommonTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BHCommonTableViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
@end
