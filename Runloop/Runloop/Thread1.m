//
//  Thread1.m
//  Runloop
//
//  Created by chendi on 15/8/6.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "Thread1.h"

@interface Thread1()<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
@property (nonatomic,assign)BOOL isFinish;
@end
@implementation Thread1

//当前线程中执行
-(void)dealloc{
    NSLog(@"dealloc current Thread:%@",[NSThread currentThread]);
}
//执行改线程的线程中执行，此处未主线程。
-(void)start{
    [super start];
    NSLog(@"start in current Thread:%@",[NSThread currentThread]);
}
//执行取消该线程的线程中执行，此处为主线程。
-(void)cancel{
    [super cancel];
    NSLog(@"cancel current Thread:%@",[NSThread currentThread]);
}
//通过重写方式实现多线程时的，线程内执行的内容。
//-(void)main{
//    [self func1];
//}
-(void)func3{
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    CFMessagePortRef port = CFMessagePortCreateLocal(kCFAllocatorDefault, CFSTR("com.someport"),NULL, NULL, NULL);
    CFRunLoopSourceRef source =  CFMessagePortCreateRunLoopSource(kCFAllocatorDefault, port, 0);
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopCommonModes);
    //有需要处理的源，会一直阻塞到源的事件到来，这里只是添加监听源，没有其他线程发送，会一直阻塞下去
    [runLoop run];
    NSLog(@"run over");
}
-(void)func2{
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    NSMachPort *port = [NSMachPort port];
    [runLoop addPort:port forMode:NSDefaultRunLoopMode];
    NSLog(@"loop start");
    //10后结束
//    [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    //一直没有事件一直阻塞
    [runLoop run];
    NSLog(@"loop over");
}
-(void)func1{
    NSLog(@"start");
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [self performSelector:@selector(connectionDidFinishLoading:) withObject:nil afterDelay:3];
    //一直阻塞到selector发生
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"kCFRunLoopBeforeWaiting");
        
    }), kCFRunLoopDefaultMode);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopEntry, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"kCFRunLoopEntry");
        
    }), kCFRunLoopDefaultMode);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeTimers, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"kCFRunLoopBeforeTimers");
        
    }), kCFRunLoopDefaultMode);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeSources, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"kCFRunLoopBeforeSources");
        
    }), kCFRunLoopDefaultMode);
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAfterWaiting, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"kCFRunLoopAfterWaiting");
        
    }), kCFRunLoopDefaultMode);
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopExit, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"kCFRunLoopExit");
        
    }), kCFRunLoopDefaultMode);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"kCFRunLoopAllActivities");
        
    }), kCFRunLoopDefaultMode);
    
    
    [runLoop run];
    NSLog(@"run over");
}
-(void)myCallbackFunc{
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"finish---");
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.isFinish = YES;
}
@end
