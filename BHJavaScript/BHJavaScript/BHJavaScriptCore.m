//
//  BHJavaScriptCore.m
//  BHJavaScript
//
//  Created by chendi on 15/9/25.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "BHJavaScriptCore.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation BHJavaScriptCore


-(void)viewDidLoad{
    JSContext *context = [JSContext new];
    //向js中添加一个log方法,在js中调用会触发改block
    context[@"log"] = ^(){
        NSLog(@"hello");
    };
    JSValue *result = [context evaluateScript:@"(function(){return 100})();"];
    [context evaluateScript:@"(function(){log();})();"];
    NSLog(@"%@",result);
}

@end
