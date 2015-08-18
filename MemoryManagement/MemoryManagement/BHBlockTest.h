//
//  BHBlockTest.h
//  MemoryManagement
//
//  Created by chendi on 15/7/29.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BHBlockTestDelegate;

@interface BHBlockTest : NSObject
@property (nonatomic,weak)id<BHBlockTestDelegate> delegate;
-(void)request;
@end
@protocol BHBlockTestDelegate <NSObject>

-(void)finish;
-(void)requestFinish;

@end
