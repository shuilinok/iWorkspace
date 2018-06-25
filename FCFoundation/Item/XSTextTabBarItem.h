//
//  XSTextTabBarItem.h
//  XSSPH
//
//  Created by shuilin on 2018/5/6.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSViewItem.h"
#import "XSLabelItem.h"

@interface XSTextTabItem : XSViewItem

@property (assign, nonatomic) BOOL selected;//选中状态

@property (strong, nonatomic) XSTouchLabelItem *normalItem;//未选中时的状态

@property (strong, nonatomic) XSTouchLabelItem *highItem;//选中时的状态

@property (strong, nonatomic) XSProtocolCommand *selectCommand;

@end


//文本TabBar视图模型
@interface XSTextTabBarItem : XSViewItem

@property (strong, nonatomic) NSArray *titleItems;//元素XSTextTabItem

- (XSTextTabItem *)tabItemForLabelItem:(XSTouchLabelItem *)labelItem;

- (XSTextTabItem *)tabItemAtIndex:(NSUInteger)index;

@end
