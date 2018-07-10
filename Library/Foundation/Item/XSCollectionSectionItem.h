//
//  XSCollectionSectionItem.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSGroupItem.h"
#import "XSViewItem.h"

@interface XSCollectionSectionItem : XSViewItem <XSGroupItem>

@property (assign, nonatomic) UIEdgeInsets insets;

@property (assign, nonatomic) double minimumLineSpacing;

@property (assign, nonatomic) double minimumInteritemSpacing;

@end
