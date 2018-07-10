//
//  XSLinkCommand.m
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSLinkCommand.h"

@interface XSLinkCommand ()

@property (strong, nonatomic) NSString *scheme;

@property (strong, nonatomic) NSArray *paramNames;

@property (strong, nonatomic) NSInvocation *invocation;

@end


@implementation XSLinkCommand

+ (XSLinkCommand *)command:(NSString *)scheme paramNames:(NSArray *)paramNames target:(id)target selector:(SEL)selector
{
    NSMethodSignature *sig  = [[target class] instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:target];
    [invocation setSelector:selector];
    
    //构建命令
    XSLinkCommand *command = [[XSLinkCommand alloc] init];
    command.invocation = invocation;
    command.scheme = scheme;
    command.paramNames = paramNames;
    
    return command;
}

- (void)execute:(NSArray *)params
{
    NSInvocation * invocation = self.invocation;
    
    NSUInteger index = 2;
    
    for(id object in params)
    {
        id param = object;
        
        [invocation setArgument:&param atIndex:index++];
    }
    
    [invocation invoke];
}

@end
