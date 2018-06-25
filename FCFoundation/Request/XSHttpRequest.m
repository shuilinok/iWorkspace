//
//  XSHttpRequest.m
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSHttpRequest.h"
#import "NSError+XS.h"
#import "XSTools.h"

@interface XSHttpRequest ()

@property (strong, nonatomic) id responseObject;

@property (copy, nonatomic) XSResultCallback callback;

@end

@implementation XSHttpRequest

- (void)send:(XSResultCallback)callback
{
    self.callback = callback;
    
    NSMutableDictionary *paramDict = nil;
    if(self.paramDict)
    {
        paramDict = [[NSMutableDictionary alloc] initWithDictionary:self.paramDict];
    }
    
    [XSTools startAsynchronousUrl:self.url parameter:paramDict method:self.method delegate:self allowCancel:NO mappingName:self.responseClassName urlCacheMode:NO finishSelector:@selector(requestFinish:) failSelector:@selector(requestFail:) timeOutSelector:@selector(requestTimeOut:)];
}

- (void)cancel
{
    
}

- (void)requestFinish:(RKMappingResult *)result
{
    if(self.callback)
    {
        LCAPIResult* object_ = result.firstObject;
        BOOL isError = NO;
        if (object_ == nil || [object_ isEqual:[NSNull null]]) {
            isError = YES;
        } else {
            isError = (object_.code == 0) ? NO : YES;
        }
        
        if (isError)
        {
            NSError *error = [NSError errorWithCode:1 xsmsg:((LCAPIResult *)result.firstObject).msg];
            self.callback(error);
            self.callback = nil;//释放
            return;
        }
        
        self.responseObject = [((LCAPIResult *)result.firstObject).data.modelList modelLastObject];
        
        self.callback(nil);
        self.callback = nil;//释放
    }
}

- (void)requestFail:(NSError *)error
{
    if(self.callback)
    {
        error = [NSError errorWithCode:2 xsmsg:@"请求失败"];
        self.callback(error);
        self.callback = nil;//释放
    }
}

- (void)requestTimeOut:(NSError *)error
{
    if(self.callback)
    {
        error = [NSError errorWithCode:3 xsmsg:@"请求超时"];
        self.callback(error);
        self.callback = nil;//释放
    }
}

@end
