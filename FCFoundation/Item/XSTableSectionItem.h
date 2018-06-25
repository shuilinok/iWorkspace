//
//  XSTableSectionItem.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSGroupItem.h"
#import "XSViewItem.h"

@interface XSTableSectionItem : XSViewItem <XSGroupItem>

@property (assign, nonatomic) double headerHeight;

@property (assign, nonatomic) double footerHeight;

@property (strong, nonatomic) XSProtocolCommand *createHeaderViewCommand;

@property (strong, nonatomic) XSProtocolCommand *createFooterViewCommand;

@end
