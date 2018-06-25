//
//  XSCoreDataRequestManager.h
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSCoreDataRequest.h"

@interface XSCoreDataRequestManager : NSObject

- (instancetype)initWithDb:(NSString *)dbName model:(NSString *)modelName;

- (void)addRequest:(XSCoreDataRequest *)request;

@end
