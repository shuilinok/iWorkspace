//
//  NSDictionary+XS.m
//  XSSPH
//
//  Created by shuilin on 2018/5/23.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "NSDictionary+XS.h"

@implementation NSDictionary (XS)

- (NSString *)stringForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if(object)
    {
        NSString *value = [NSString stringWithFormat:@"%@",object];
        return value;
    }
    
    return nil;
}

- (NSNumber *)boolNumberForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if(object)
    {
        NSString *value = [NSString stringWithFormat:@"%@",object];
        NSNumber *number = [NSNumber numberWithBool:[value boolValue]];
        
        return number;
    }
    
    return nil;
}

- (NSNumber *)intNumberForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if(object)
    {
        NSString *value = [NSString stringWithFormat:@"%@",object];
        NSNumber *number = [NSNumber numberWithInteger:[value integerValue]];
        
        return number;
    }
    
    return nil;
}

- (NSNumber *)doubleNumberForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if(object)
    {
        NSString *value = [NSString stringWithFormat:@"%@",object];
        NSNumber *number = [NSNumber numberWithDouble:[value doubleValue]];
        
        return number;
    }
    
    return nil;
}

- (NSArray *)arrayForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if([object isKindOfClass:[NSArray class]])
    {
        return object;
    }
    
    return nil;
}

@end
