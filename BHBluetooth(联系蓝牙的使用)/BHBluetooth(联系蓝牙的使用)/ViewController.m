//
//  ViewController.m
//  BHBluetooth(联系蓝牙的使用)
//
//  Created by chendi on 15/9/17.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "BHUICommonUtil.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController ()<CBCentralManagerDelegate,UITableViewDelegate,UITableViewDataSource,CBPeripheralDelegate>{
    CBCentralManager *cbManager;
    UIButton *button;
    UITableView *tableView;
    NSMutableArray *data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    cbManager = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
    button = [BHUICommonUtil createATestButton:@"scan" frame:CGRectMake(0, BH_SCREEN_HEIGHT-50, BH_SCREEN_WIDTH, 50) action:@selector(onClick:) owner:self];
    button.enabled = NO;
    button.backgroundColor = [UIColor blueColor];
    tableView = [[UITableView alloc] initWithFrame:[BHUICommonUtil changeValue:@{@"h":@(BH_SCREEN_HEIGHT-50)} origin:BH_SCREEN_SIZE]];
    [self.view addSubview: tableView];
    data = [NSMutableArray array];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"123"];
    [self.view addSubview:button];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}
-(nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView1 cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@,%@",[data[indexPath.row] objectForKey:@"name"],[data[indexPath.row] objectForKey:@"uuid"]];
    return cell;
}


-(void)onClick:(UIButton *)button{
    [self discover];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    NSLog(@"update");
    switch (central.state) {
        case CBCentralManagerStateUnknown:
            
            break;
        case CBCentralManagerStateResetting:
            
            break;
        case CBCentralManagerStateUnsupported:
            
            break;
        case CBCentralManagerStateUnauthorized:
            
            break;
            
        case CBCentralManagerStatePoweredOn:
        {
            button.enabled = YES;
            
        }
            break;
        case CBCentralManagerStatePoweredOff:
            
            break;
        default:
            break;
    }
}
- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary<NSString *, id> *)dict{
    
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *, id> *)advertisementData RSSI:(NSNumber *)RSSI{
    [data addObject:@{@"name":[NSString stringWithFormat:@"%@",peripheral.name],@"uuid":peripheral.identifier.UUIDString,@"peripheral":peripheral}];
    [tableView reloadData];
}
-(void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    CBPeripheral *peripheral = [data[indexPath.row] objectForKey:@"peripheral"];
    [peripheral setDelegate:self];
    [cbManager connectPeripheral:peripheral options:nil];
}
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
    
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error{
    
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error{
    
}
-(void)discover{
    [cbManager scanForPeripheralsWithServices:nil options:nil];
}

- (void)peripheralDidUpdateName:(CBPeripheral *)peripheral{
    NSLog(@"update name");
}
- (void)peripheral:(CBPeripheral *)peripheral didModifyServices:(NSArray<CBService *> *)invalidatedServices{
    NSLog(@"did modify services");
}
- (void)peripheralDidUpdateRSSI:(CBPeripheral *)peripheral error:(nullable NSError *)error{
    NSLog(@"update rssi");
}
- (void)peripheral:(CBPeripheral *)peripheral didReadRSSI:(NSNumber *)RSSI error:(nullable NSError *)error{
    NSLog(@"did read rssi");
}
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(nullable NSError *)error{
    NSLog(@"did discover services");
}
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverIncludedServicesForService:(CBService *)service error:(nullable NSError *)error{
    NSLog(@"did discover include services for service");
}
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(nullable NSError *)error{
    NSLog(@"did discover characteristics");
}
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error{
    NSLog(@"update value");
}
- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error{
    NSLog(@"write value");
}
- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error{
    NSLog(@"update not");
}
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error{
    NSLog(@"discover des");
}
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForDescriptor:(CBDescriptor *)descriptor error:(nullable NSError *)error{
    NSLog(@"update");
}
- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForDescriptor:(CBDescriptor *)descriptor error:(nullable NSError *)error{
    NSLog(@"write value for desc");
}


@end
