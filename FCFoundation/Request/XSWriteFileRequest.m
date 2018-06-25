//
//  XSWriteFileRequest.m
//  XSSPH
//
//  Created by shuilin on 2018/5/3.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSWriteFileRequest.h"

@interface XSWriteFileRequest ()

@property (copy, nonatomic) XSResultCallback callback;

@end


@implementation XSWriteFileRequest

- (void)send:(XSResultCallback)callback
{
    self.callback = callback;
    
    BOOL bOK = [self.fileData writeToFile:self.filePath atomically:YES];
    
    NSError *error = bOK ? nil : [NSError errorWithDomain:@"" code:1002 userInfo:nil];
    
    if(self.callback)
    {
        self.callback(error);
        self.callback = nil;
    }
}

@end
