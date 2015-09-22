//
//  main.m
//  BHToZero
//
//  Created by chendi on 15/9/11.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        static int i = 0;
        while(true){
            NSMutableString *str = [NSMutableString string];
            for(int j = 0;j<i;j++){
                [str appendString:@"*"];
            }
            NSLog(@"%@,%d",str,i);
            i++;
            [NSThread sleepForTimeInterval:1/1];
        }
    }
    return 0;
}
