//
//  XSAlertViewRequest.h
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSCallback.h"
#import "XSAlertViewItem.h"

@interface XSAlertViewRequest : NSObject

/* 标题 */
@property (strong, nonatomic) NSString *title;

/* 提示内容 */
@property (strong, nonatomic) NSString *message;

/* 选项数组  */
@property (strong, nonatomic) NSArray *items;

/* 显示在哪个控制器上 */
@property (weak, nonatomic) UIViewController *presentController;

/* 选择的是第几个 */
@property (readonly, assign, nonatomic) NSInteger selectedIndex;

- (void)send:(XSCallback)callback;

@end
