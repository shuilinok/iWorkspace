//
//  XSLabelItem.h
//  XSSPH
//
//  Created by shuilin on 2018/5/6.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSViewItem.h"

//描述静态标签
@interface XSLabelItem : XSViewItem

@property (strong, nonatomic) NSString *text;//文本

@property (strong, nonatomic) UIColor *textColor;//文本颜色

@property (strong, nonatomic) UIFont *font;//文本形状

@end

//可点击的标签
@interface XSTouchLabelItem : XSLabelItem

@property (strong, nonatomic) XSProtocolCommand *clickCommand;//点击命令

@end


