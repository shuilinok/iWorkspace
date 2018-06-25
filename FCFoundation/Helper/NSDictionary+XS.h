//
//  NSDictionary+XS.h
//  XSSPH
//
//  Created by shuilin on 2018/5/23.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XS)

- (NSString *)stringForKey:(NSString *)key;

- (NSNumber *)boolNumberForKey:(NSString *)key;

- (NSNumber *)intNumberForKey:(NSString *)key;

- (NSNumber *)doubleNumberForKey:(NSString *)key;

- (NSArray *)arrayForKey:(NSString *)key;

@end
