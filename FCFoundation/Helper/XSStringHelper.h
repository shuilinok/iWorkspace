//
//  XSStringHelper.h
//  XSSPH
//
//  Created by shuilin on 2018/5/24.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSStringHelper : NSObject

+ (NSString *)notRounding:(float)price afterPoint:(int)position;

+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

+ (CGFloat)textWidth:(NSString *)text font:(UIFont *)font;

+ (NSString *)getPriceString:(NSNumber *)priceNumber;

@end
