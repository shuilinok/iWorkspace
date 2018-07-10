//
//  XSTextTabBarItem.m
//  XSSPH
//
//  Created by shuilin on 2018/5/6.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSTextTabBarItem.h"


@implementation XSTextTabItem

@end


@implementation XSTextTabBarItem

- (XSTextTabItem *)tabItemForLabelItem:(XSTouchLabelItem *)labelItem
{
    for(XSTextTabItem *temp in self.titleItems)
    {
        if(temp.normalItem == labelItem || temp.highItem == labelItem)
        {
            return temp;
        }
    }
    
    return nil;
}

- (XSTextTabItem *)tabItemAtIndex:(NSUInteger)index
{
    if(index < self.titleItems.count)
    {
        return [self.titleItems objectAtIndex:index];
    }
    
    return nil;
}

@end
