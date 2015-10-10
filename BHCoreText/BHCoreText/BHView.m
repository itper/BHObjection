//
//  BHView.m
//  BHCoreText
//
//  Created by chendi on 15/10/9.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "BHView.h"
#import <CoreText/CoreText.h>

@implementation BHView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ref, 0, self.bounds.size.height);
    CGContextScaleCTM(ref, 1, -1);
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"hello\nhello" attributes:nil];
    
    NSMutableParagraphStyle *pStyle = [[NSMutableParagraphStyle alloc] init];
    [pStyle setLineSpacing:12];
    
    [attString addAttribute:NSParagraphStyleAttributeName value:pStyle range:NSMakeRange(0, attString.length)];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    CGPathRef path = CGPathCreateWithRect(self.bounds, NULL);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attString.length), path, NULL);
    CTFrameDraw(frame, ref);
    CFRelease(frame);
    CFRelease(framesetter);
    CFRelease(path);
}
-(NSDictionary*)createCTAttribute{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[(id)kCTForegroundColorAttributeName] = ( id)[UIColor redColor].CGColor;
//    dic[(id)kCTForegroundColorAttributeName] = (__bridge id)CGColorCreateCopy([UIColor yellowColor].CGColor));
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", 12, NULL);
    dic[(id)kCTFontAttributeName] = (id)[self getFontRef];
    dic[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    
    
    
    return dic;
}
-(CTFontRef)getFontRef{
    return CTFontCreateWithName((CFStringRef)@"ArialMT", 12, NULL);
}
@end
