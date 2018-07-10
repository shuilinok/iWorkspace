//
//  XSLinkCommandManager.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSLinkCommand.h"

//命令管理器
@interface XSLinkCommandManager : NSObject

//加入命令
- (void)addCommand:(XSLinkCommand *)command;

//根据url执行相应的命令，执行了返回YES，否则NO；url例如：@"person://name=张三&age=18"
- (BOOL)executeCommand:(NSString *)url;

@end
