//
//  XSViewHelper.h
//  XSSPH
//
//  Created by shuilin on 2018/5/11.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSViewHelper : NSObject

//加载底部细线
+ (void)addBottomLine:(UIView *)view lineColor:(UIColor *)color;

+ (void)addBottomLine:(UIView *)view lineColor:(UIColor *)color x:(CGFloat)x;

+ (void)addTopLine:(UIView *)view lineColor:(UIColor *)color;

@end
