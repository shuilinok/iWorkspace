//
//  XSLinkCommandManager.m
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSLinkCommandManager.h"

@interface XSLinkCommandManager ()

@property (strong, nonatomic) NSMutableArray *commands;

@end


@implementation XSLinkCommandManager

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.commands = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addCommand:(XSLinkCommand *)command
{
    if(command)
    {
        [self.commands addObject:command];
    }
}

//两个字符串数组是否相等（不区分大小写）
- (BOOL)names:(NSArray *)names equals:(NSArray *)keys
{
    NSMutableArray *lownames = [[NSMutableArray alloc] init];
    for(NSString *str in names)
    {
        NSString *text = [str lowercaseString];
        [lownames addObject:text];
    }
    
    NSMutableArray *lowkeys = [[NSMutableArray alloc] init];
    for(NSString *str in keys)
    {
        NSString *text = [str lowercaseString];
        [lowkeys addObject:text];
    }
    
    NSMutableSet *nameSet = [[NSMutableSet alloc] initWithArray:lownames];
    NSMutableSet *keySet = [[NSMutableSet alloc] initWithArray:lowkeys];
    
    return [nameSet isEqualToSet:keySet];
}

- (XSLinkCommand *)findCommand:(NSString *)scheme paramNames:(NSArray *)paramNames
{
    if(scheme.length == 0)
    {
        return nil;
    }
    
    for(XSLinkCommand *command in self.commands)
    {
        if([command.scheme compare:scheme options:NSCaseInsensitiveSearch] == NSOrderedSame)
        {
            if([self names:command.paramNames equals:paramNames])
            {
                return command;
            }
        }
    }
    
    return nil;
}

//把参数字符串转换成字典
- (NSDictionary *)paramDict:(NSString *)paramString
{
    NSArray *paramExps = [paramString componentsSeparatedByString:@"&"];
    
    //找出参数放进字典
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc] init];
    for(NSString *exp in paramExps)
    {
        NSRange rng = [exp rangeOfString:@"="];
        NSRange nameRange = NSMakeRange(0, rng.location);
        NSString *name = [exp substringWithRange:nameRange];
        
        NSUInteger valuePos = rng.location + rng.length;
        NSString *value = [exp substringFromIndex:valuePos];
        
        if(name.length > 0 && value.length > 0)
        {
            [paramDict setObject:value forKey:name];
        }
    }
    
    return paramDict;
}


- (BOOL)executeCommand:(NSString *)url
{
    url = [url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//去除两端空白字符
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];//除去空格
    url = [url stringByReplacingOccurrencesOfString:@"  " withString:@""];//除去tab
    
    NSRange range = [url rangeOfString:@"://"];
    if(range.location == NSNotFound)
    {
        return NO;
    }
    
    NSRange schemeRange = NSMakeRange(0, range.location);
    NSString *scheme = [url substringWithRange:schemeRange];
    
    NSUInteger paramPos = range.location + range.length;
    NSString *paramString = [url substringFromIndex:paramPos];
    NSDictionary *paramDict = [self paramDict:paramString];
    NSArray *names = [paramDict allKeys];
    
    XSLinkCommand *command = [self findCommand:scheme paramNames:names];
    
    if(command)
    {
        //按顺序找出参数
        NSMutableArray *params = [[NSMutableArray alloc] init];
        for(NSString *name in command.paramNames)
        {
            NSString *param = [paramDict objectForKey:name];
            [params addObject:param];
        }
        
        [command execute:params];
        
        return YES;
    }
    
    return NO;
}

@end
