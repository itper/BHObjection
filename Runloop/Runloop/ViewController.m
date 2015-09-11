//
//  ViewController.m
//  Runloop
//
//  Created by chendi on 15/8/6.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "Thread1.h"
#import "BHUICommonUtil.h"


@interface ViewController ()<NSURLConnectionDataDelegate>
@property (nonatomic,assign)BOOL finished;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [BHUICommonUtil createATestButton:@"test" frame:CGRectMake(100, 100, 100, 100) action:@selector(press:) owner:self];
    [self.view addSubview:button];
    
    UIButton *button1 = [BHUICommonUtil createATestButton:@"test1" frame:CGRectMake(100, 200, 100, 100) action:@selector(onClick:) owner:self];
    [self.view addSubview:button1];
}

-(void)onClick:(UIButton *)button{
//    [[NSRunLoop currentRunLoop] getCFRunLoop];
//    CFRunLoopStop([[NSRunLoop currentRunLoop] getCFRunLoop]);
//    [[NSRunLoop currentRunLoop] runMode:nil beforeDate:nil];
//    NSLog(@"click");
    
    Thread1 *thread = [[Thread1 alloc] initWithTarget:self selector:@selector(run:) object:nil];
    [thread start];
    [self performSelector:@selector(func:) onThread:thread withObject:nil waitUntilDone:NO];
    
}
-(void)func:(NSObject *)obj{
    NSLog(@"exc");
}
-(void)touchesBegan:(nonnull NSSet *)touches withEvent:(nullable UIEvent *)event{
    
}
-(void)press:(id)sender
{
    NSLog(@"%@,%@",[NSRunLoop currentRunLoop].currentMode,NSRunLoopCommonModes);
    [(UIButton*)sender setSelected:YES];
    NSLog(@"begin"); // 1
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];  // 2
    NSLog(@"end"); // 3
    
    self.finished = YES;
    [NSThread detachNewThreadSelector:@selector(loadPageInBackground:)toTarget:self withObject:nil]; // 4
    while (self.finished) {
        //无消息时候会一直阻塞，有消息的时候，处理消息，执行下一步，在这里，如果后台任务未完成，继续阻塞处理消息。
        [[NSRunLoop currentRunLoop] runMode:@"123" beforeDate:[NSDate distantFuture]];
        NSLog(@"while end");
    }
    NSLog(@"over");
    
}
-(void)loadPageInBackground:(id)sender
{
    sleep(13); // 6
    NSLog(@"timer"); // 7
    self.finished = NO; // 8
    [self performSelector:@selector(doNothing:) withObject:nil];
}
-(void)doNothing:(NSObject*)obj{
    NSLog(@"do nothing");
}
-(void)run:(NSObject*)obj{
    CFRunLoopRun();
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    self.finished = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
