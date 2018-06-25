//
//  XSTableViewItem.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSGroupItem.h"
#import "XSTableSectionItem.h"
#import "XSTableCellItem.h"

@interface XSTableViewItem : XSViewItem <XSGroupItem>

//总高度
- (CGFloat)totalHeight;

@end
