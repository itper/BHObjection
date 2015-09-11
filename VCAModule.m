//
//  VCAModule.m
//  BHObjection
//
//  Created by chendi on 15/8/18.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "VCAModule.h"
#import "ViewControllerA.h"
#import "ViewControllerAProtocol.h"
#import "JSObjection.h"

@implementation VCAModule

+(void)load{
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    injector = injector?:[JSObjection createInjector];
    injector = [injector withModule:[self new]];
    [JSObjection setDefaultInjector:injector];
}

- (void)configure{
    [self bindClass:NSClassFromString(@"ViewControllerA") toProtocol:@protocol(ViewControllerAProtocol)];
}
@end
