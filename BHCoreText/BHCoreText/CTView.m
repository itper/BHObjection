//
//  CTView.m
//  BHCoreText
//
//  Created by chendi on 15/8/7.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "CTView.h"
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@implementation CTView

-(void)drawRect:(CGRect)rect{
    
    
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    NSAttributedString *attstring = [[NSAttributedString alloc] initWithString:@"hello core text world"];
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attstring);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attstring.length), path, NULL);
    CTFrameDraw(frame, context);
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}
@end
