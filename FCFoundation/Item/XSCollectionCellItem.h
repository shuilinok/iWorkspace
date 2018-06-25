//
//  XSCollectionCellItem.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSGroupItem.h"
#import "XSViewItem.h"

@protocol XSCollectionCellItem <XSGroupItem>

@property (assign, nonatomic) CGSize size;

@end

@interface XSCollectionCellItem : XSViewItem <XSGroupItem>

@property (strong, nonatomic) XSProtocolCommand *selectCommand;

@property (assign, nonatomic) CGSize size;

//@property (strong, nonatomic) NSIndexPath *indexPath;

@end
