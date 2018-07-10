//
//  XSStringHelper.m
//  XSSPH
//
//  Created by shuilin on 2018/5/24.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSStringHelper.h"

@implementation XSStringHelper

+ (NSString *)notRounding:(float)price afterPoint:(int)position
{
       NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
       NSDecimalNumber *ouncesDecimal;
    
       NSDecimalNumber *roundedOunces;
    
       ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    
       roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
       return [NSString stringWithFormat:@"%@",roundedOunces];
    
}

+ (CGFloat)textHeight:(NSString *)text width:(CGFloat)width font:(UIFont *)font
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
}

+ (CGFloat)textWidth:(NSString *)text font:(UIFont *)font
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.width;
}

+ (NSString *)getPriceString:(NSNumber *)priceNumber
{
    NSString *str = [NSString stringWithFormat:@"%0.2f",[priceNumber doubleValue]];
    priceNumber = [NSNumber numberWithDouble:[str doubleValue]];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterRoundFloor;
    NSString *pStr = [formatter stringFromNumber:priceNumber];
    pStr = [pStr stringByReplacingOccurrencesOfString:@"," withString:@""];
    return pStr;
}

@end
