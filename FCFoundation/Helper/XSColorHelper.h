//
//  XSColorHelper.h
//  XSSPH
//
//  Created by shuilin on 2018/5/7.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSColorHelper : NSObject

+ (UIColor *)colorWithRGB:(long)value;

+ (UIColor *)colorWithRGB:(long)value alpha:(CGFloat)alpha;
@end
