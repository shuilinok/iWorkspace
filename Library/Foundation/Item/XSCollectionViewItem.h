//
//  XSCollectionViewItem.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSGroupItem.h"
#import "XSCollectionCellItem.h"
#import "XSCollectionSectionItem.h"

@interface XSCollectionViewItem : XSViewItem <XSGroupItem>

@property (strong, nonatomic) XSProtocolCommand *createHeaderViewCommad;

@end
