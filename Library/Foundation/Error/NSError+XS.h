//
//  NSError+XS.h
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (XS)

+ (NSError *)errorWithCode:(NSUInteger)code xsmsg:(NSString *)message;

/* 错误信息 */
- (NSString *)xsmsg;

@end
