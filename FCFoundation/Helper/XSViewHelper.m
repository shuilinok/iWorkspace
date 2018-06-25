//
//  XSViewHelper.m
//  XSSPH
//
//  Created by shuilin on 2018/5/11.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSViewHelper.h"

@implementation XSViewHelper

+ (void)addBottomLine:(UIView *)view lineColor:(UIColor *)color
{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0.0f, view.frame.size.height - 0.5, view.frame.size.width, 0.5f);
    layer.backgroundColor = color.CGColor;
    
    [view.layer addSublayer:layer];
    
}

+ (void)addBottomLine:(UIView *)view lineColor:(UIColor *)color x:(CGFloat)x
{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(x, view.frame.size.height - 0.5, view.frame.size.width - x, 0.5f);
    layer.backgroundColor = color.CGColor;
    
    [view.layer addSublayer:layer];
}

+ (void)addTopLine:(UIView *)view lineColor:(UIColor *)color
{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0.0f, 0.0, view.frame.size.width, 0.5f);
    layer.backgroundColor = color.CGColor;
    
    [view.layer addSublayer:layer];
}
@end
