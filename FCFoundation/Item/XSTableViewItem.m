//
//  XSTableViewItem.m
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSTableViewItem.h"

@interface XSTableViewItem ()

@property (strong, nonatomic) id<XSGroupItem> groupItem;
@end

@implementation XSTableViewItem

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        XSGroupItem *groupItem = [[XSGroupItem alloc] init];
        
        self.groupItem = groupItem;
    }
    
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if([self.groupItem respondsToSelector:aSelector])
    {
        return self.groupItem;
    }
    
    return nil;
}

- (CGFloat)totalHeight
{
    CGFloat height = 0.0;
    
    NSUInteger sectionCount = [self itemCount];
    for(NSUInteger i = 0; i < sectionCount ; i++)
    {
        XSTableSectionItem *sectionItem = [self itemAtIndex:i];
        height += sectionItem.headerHeight;
        height += sectionItem.height;
        height += sectionItem.footerHeight;
        
        NSUInteger cellCount = [sectionItem itemCount];
        for(NSUInteger j = 0; j < cellCount; j++)
        {
            XSTableCellItem *cellItem = [sectionItem itemAtIndex:j];
            height += cellItem.height;
        }
    }
    
    return height;
}

@end
