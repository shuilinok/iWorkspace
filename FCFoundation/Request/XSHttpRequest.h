//
//  XSHttpRequest.h
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSCallback.h"

@interface XSHttpRequest : NSObject

@property (strong, nonatomic) NSString *url;

@property (strong, nonatomic) NSString *method;//"POST,"GET"...

@property (strong, nonatomic) NSDictionary *headerDict;

@property (strong, nonatomic) NSDictionary *paramDict;

@property (strong, nonatomic) NSString *responseClassName;

@property (readonly, strong, nonatomic) id responseObject;

- (void)send:(XSResultCallback)callback;

- (void)cancel;

@end


@interface XSHttpRequest (ManagerAccess)

@property (readonly, copy, nonatomic) XSResultCallback callback;

@end
