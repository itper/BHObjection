//
//  BHBlockTest.m
//  MemoryManagement
//
//  Created by chendi on 15/7/29.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHBlockTest.h"

@implementation BHBlockTest

-(void)request{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:3];
        [self.delegate requestFinish];
        NSLog(@"request finish");
        NSLog(@"finish");
        [self.delegate finish];
    });
}
-(void)dealloc{
    NSLog(@"dealloc");
}
@end
