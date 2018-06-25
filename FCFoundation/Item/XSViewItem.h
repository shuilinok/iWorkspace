//
//  XSViewItem.h
//  XSSPH
//
//  Created by shuilin on 2018/5/6.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSProtocolCommand.h"

//视图一般描述
@interface XSViewItem : NSObject

@property (assign, nonatomic) CGFloat x;//左上角坐标x

@property (assign, nonatomic) CGFloat y;//左上角坐标y

@property (assign, nonatomic) CGFloat width;//视图宽度

@property (assign, nonatomic) CGFloat height;//视图高度

@property (strong, nonatomic) XSProtocolCommand *createViewCommand;//创建相应的视图命令

@end
