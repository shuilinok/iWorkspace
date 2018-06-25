//
//  XSProtocolCommand.m
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSProtocolCommand.h"

@interface XSProtocolCommand ()

@property (strong, nonatomic) NSInvocation *invocation;

@property (weak, nonatomic) id target;

@property (assign, nonatomic) SEL selector;

@end

@implementation XSProtocolCommand

/*
+ (XSProtocolCommand *)command:(id)target selector:(SEL)selector
{
    XSProtocolCommand *command = [[XSProtocolCommand alloc] init];
    command.target = target;
    command.selector = selector;
    
    if(target && selector)
    {
        NSMethodSignature *sig  = [[target class] instanceMethodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        [invocation setTarget:target];
        [invocation setSelector:selector];
        
        command.invocation = invocation;
    }
    
    return command;
}

+ (XSProtocolCommand *)partCommand:(NSString *)selectorName
{
    XSProtocolCommand *command = [[XSProtocolCommand alloc] init];
    SEL selector = NSSelectorFromString(selectorName);
    command.selector = selector;
    
    return command;
}
*/

+ (XSProtocolCommand *)command:(id)target selectorName:(NSString *)selectorName
{
    XSProtocolCommand *command = [[XSProtocolCommand alloc] init];
    SEL selector = NSSelectorFromString(selectorName);
    command.target = target;
    command.selector = selector;
    
    if(target && selector)
    {
        NSMethodSignature *sig  = [[target class] instanceMethodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        [invocation setTarget:target];
        [invocation setSelector:selector];
        
        command.invocation = invocation;
    }
    
    return command;
}

- (id)execute:(NSUInteger)num,...
{
    if(self.target == nil)
    {
        NSLog(@"警告：方法 %@ 没有设置实现的对象",NSStringFromSelector(self.selector));
        return nil;
    }
    
    if(self.target && ![self.target respondsToSelector:self.selector])
    {
        NSLog(@"警告：类 %@ 没有实现方法 %@",NSStringFromClass([self.target class]),NSStringFromSelector(self.selector));
        return nil;
    }
    
    NSInvocation * invocation = self.invocation;
    
    NSUInteger index = 2;
    
    /* 可变参数 */
    va_list args;
    
    va_start(args,num);
    
    while (num > index - 2)
    {
        id param = va_arg(args, id);//下一个参数;
        
        [invocation setArgument:&param atIndex:index++];
    }
    
    va_end(args);
    
    [invocation invoke];
    
    //返回值
    __unsafe_unretained id value;
    
    [invocation getReturnValue:&value];
    
    return value;
}
@end

