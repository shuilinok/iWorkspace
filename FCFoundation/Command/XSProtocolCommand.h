//
//  XSProtocolCommand.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>

//命令类，用于回调，取代delegate和block回调方式，广泛用于视图消息响应

@interface XSProtocolCommand : NSObject

+ (XSProtocolCommand *)command:(id)target selectorName:(NSString *)selectorName;

//+ (XSProtocolCommand *)command:(id)target selector:(SEL)selector;
//
//+ (XSProtocolCommand *)partCommand:(NSString *)selectorName;

@property (readonly, weak, nonatomic) id target;

@property (readonly, assign, nonatomic) SEL selector;

- (id)execute:(NSUInteger)num,...;//num表示后面的可变参数的个数，可变参数须为id类型

@end
