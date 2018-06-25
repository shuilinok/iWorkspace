//
//  XSCollectionSectionItem.m
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSCollectionSectionItem.h"

@interface XSCollectionSectionItem ()

@property (strong, nonatomic) id<XSGroupItem> groupItem;
@end

@implementation XSCollectionSectionItem

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

@end
