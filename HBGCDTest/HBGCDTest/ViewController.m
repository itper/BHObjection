//
//  ViewController.m
//  HBGCDTest
//
//  Created by chendi on 15/7/30.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //dispatch_*_async 函数立刻返回
    //dispatch_*_sync block执行完成后，返回。
    dispatch_queue_t _barrierQueue = dispatch_queue_create("com.hackemist.SDWebImageDownloaderBarrierQueue", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"--start");
    /**
     *  dispatch_sync天极大到队列之后，直到block执行完成结束该函数才会返回，否则该函数一直阻塞。
     */
    dispatch_sync(_barrierQueue, ^{
        NSLog(@"start");
        [NSThread sleepForTimeInterval:3];
        NSLog(@"end");
    });
    NSLog(@"next 1");
    /**
     *  dispatch_async添加到队列之后立刻返回
     */
    dispatch_async(_barrierQueue, ^{
        NSLog(@"start 1");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"end 1");
    });
    NSLog(@"next 2");
    dispatch_async(_barrierQueue, ^{
        
        NSLog(@"start 2");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"end 2");
    });
    NSLog(@"next 3");
    /**
     *  该函数不阻塞，直接返回，添加的该block会在已存在的block都执行完成之后执行该block，并在该block执行完成之后，继续执行其他block
     */
    dispatch_barrier_async(_barrierQueue, ^{
        NSLog(@"start 3");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"end 3");
    });
    NSLog(@"next 4");
    /**
     *  该函数一直等到该block执行完成之后，才会返回
     */
    dispatch_barrier_sync(_barrierQueue, ^{
        NSLog(@"start 4");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"end 4");
    });
    
    NSLog(@"next 5");
    dispatch_async(_barrierQueue, ^{
        NSLog(@"start 5");
        
    });
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
