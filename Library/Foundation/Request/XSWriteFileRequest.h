//
//  XSWriteFileRequest.h
//  XSSPH
//
//  Created by shuilin on 2018/5/3.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSCallback.h"

@interface XSWriteFileRequest : NSObject

@property (strong, nonatomic) NSString *filePath;

@property (strong, nonatomic) NSData *fileData;

- (void)send:(XSResultCallback)callback;

@end
