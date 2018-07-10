//
//  XSTableCellItem.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSGroupItem.h"
#import "XSViewItem.h"

@interface XSTableCellItem : XSViewItem <XSGroupItem>

@property (strong, nonatomic) XSProtocolCommand *selectCommand;

@end
