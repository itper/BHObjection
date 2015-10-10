//
//  BHTestObject.m
//  BHIMP
//
//  Created by chendi on 15/9/28.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "BHTestObject.h"

@implementation BHTestObject
-(NSString *)test:(NSString*)arg{
    return [NSString stringWithFormat:@"%@%@",@"hello:",arg];
}
@end
