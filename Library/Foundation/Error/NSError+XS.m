//
//  NSError+XS.m
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "NSError+XS.h"

#define kErrorMessage     @"ErrorMessage"

@implementation NSError (XS)

+ (NSError *)errorWithCode:(NSUInteger)code xsmsg:(NSString *)message
{
    NSDictionary *userInfo = @{
                               kErrorMessage:message ? : @""
                               };
    
    NSError *error = [NSError errorWithDomain:@"com.91sph.iOS" code:code userInfo:userInfo];
    
    return error;
}

/* 错误信息 */
- (NSString *)xsmsg
{
    return [self.userInfo objectForKey:kErrorMessage];
}
@end
