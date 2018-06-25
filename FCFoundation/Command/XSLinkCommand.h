//
//  XSLinkCommand.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>

//点击链接命令，通常用于捕获H5点击事件，参数之间用&分开，例如：person://name=张三&age=18

@interface XSLinkCommand : NSObject

/*
 scheme比如例中的@"person"，
 paramNames比如例中的@[@"name",@"age"]，
 target是处理响应的对象，
 selector是响应方法，其参数顺序和paramNames一致，比如@selector(handleName:age:)
 */

+ (XSLinkCommand *)command:(NSString *)scheme paramNames:(NSArray *)paramNames target:(id)target selector:(SEL)selector;

@property (readonly, strong, nonatomic) NSString *scheme;

@property (readonly, strong, nonatomic) NSArray *paramNames;

- (void)execute:(NSArray *)params;//参数数组，比如@[@"张三",@"18"]

@end
