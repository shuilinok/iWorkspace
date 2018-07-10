//
//  XSAlertViewItem.h
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSAlertViewItem : NSObject

/* 选项标题(确定，取消等) */
@property (strong, nonatomic) NSString *title;

/* 风格，Default=0, Cancel=1, Destructive=2 */
@property (assign, nonatomic) NSInteger style;

@end
