//
//  XSReadFileRequest.m
//  XSSPH
//
//  Created by shuilin on 2018/5/3.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSReadFileRequest.h"

@interface XSReadFileRequest ()

@property (strong, nonatomic) NSData *fileData;

@property (copy, nonatomic) XSResultCallback callback;

@end

@implementation XSReadFileRequest

- (void)send:(XSResultCallback)callback
{
    self.callback = callback;
    
    NSString *filePath = self.filePath;
    
    BOOL isDirectory;
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory])
    {
        if(!isDirectory)
        {
            NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
            self.fileData = data;
            
            if(self.callback)
            {
                self.callback(nil);
                self.callback = nil;
            }
            
            return;
        }
    }
    
    NSError *error = [NSError errorWithDomain:@"" code:1001 userInfo:nil];
    
    if(self.callback)
    {
        self.callback(error);
        self.callback = nil;
    }
}
@end
