//
//  ViewController.m
//  BHCollectionView
//
//  Created by chendi on 15/9/15.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data =
    @[
      @{
          @"title":@"UIScrollView auto layout",
          @"class":@"scrollview",
          },
      @{
          @"title":@"simple auto layout layout",
          @"class":@"simple",
          },
      @{
          @"title":@"UITableView auto layout",
          @"class":@"tableview",
          },
      @{
          @"title":@"greater than or equals to",
          @"class":@"greaterthanorequalto"
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
    [self performSegueWithIdentifier:[self.data[indexPath.row] objectForKey:@"class"] sender:indexPath];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    segue.destinationViewController.title = [self.data[((NSIndexPath*)sender).row] objectForKey:@"title"];
}
@end
