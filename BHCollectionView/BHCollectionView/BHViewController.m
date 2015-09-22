//
//  ViewController.m
//  BHCollectionView
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHViewController.h"
#import "BHStackCollectionViewController.h"
#import "BHStackLayout.h"
#import "BHCoverflowCollectionViewController.h"

@interface BHViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSArray *data;
@end

@implementation BHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data =
  @[
  @{
      @"title":@"stack layout",
      @"class":@"BHStackCollectionViewController",
      @"layout":@"BHStackLayout"
      },
  @{
      @"title":@"coverflow",
      @"class":@"BHCoverflowCollectionViewController",
      @"layout":@"BHStackLayout"
      },
  @{
      @"title":@"circle",
      @"class":@"BHCircleCollectionViewController",
      @"layout":@"BHCircleLayout"
      }
  ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = [self.data[indexPath.row] objectForKey:@"title"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cla = NSClassFromString([self.data[indexPath.row] objectForKey:@"class"]);
    Class layoutCla = NSClassFromString([self.data[indexPath.row] objectForKey:@"layout"]);
    UICollectionViewLayout *layout = [[layoutCla alloc] init];
    UICollectionViewController *controller = [[cla alloc] initWithCollectionViewLayout:layout];
    controller.title = [self.data[indexPath.row] objectForKey:@"title"];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
