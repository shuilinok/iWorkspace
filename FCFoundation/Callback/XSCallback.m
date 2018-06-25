//
//  XSCallback.m
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSCallback.h"


void mainXSCallback(XSCallback callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (callback)
        {
            callback();
        }
    });
}

void mainXSResultCallback(XSResultCallback callback, NSError *error)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (callback)
        {
            callback(error);
        }
    });
}

void mainXSDataResultCallback(XSDataResultCallback callback, id data, NSError *error)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (callback)
        {
            callback(data,error);
        }
    });
}
