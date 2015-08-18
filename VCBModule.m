//
//  VCAModule.m
//  BHObjection
//
//  Created by chendi on 15/8/18.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "VCBModule.h"
#import "ViewControllerA.h"
#import "ViewControllerAProtocol.h"
#import "JSObjection.h"

@implementation VCBModule

+(void)load{
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    injector = injector?:[JSObjection createInjector];
    injector = [injector withModule:[self new]];
    [JSObjection setDefaultInjector:injector];
}

- (void)configure{
    [self bindClass:NSClassFromString(@"ViewControllerB") toProtocol:NSProtocolFromString(@"ViewControllerAProtocol")];
}
@end
