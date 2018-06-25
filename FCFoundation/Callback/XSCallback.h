//
//  XSCallback.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>


//定义常用回调block
typedef void (^XSCallback) (void);

typedef void (^XSResultCallback) (NSError* error);

typedef void (^XSDataResultCallback) (id data,NSError* error);

//在主线程返回
void mainXSCallback(XSCallback callback);

void mainXSResultCallback(XSResultCallback callback, NSError *error);

void mainXSDataResultCallback(XSDataResultCallback callback, id data, NSError *error);
