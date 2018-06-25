//
//  XSGroupItem.m
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSGroupItem.h"

@interface XSGroupItem ()

@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation XSGroupItem

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.items = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addItem:(id<XSGroupItem>)item
{
    if(item && ![self.items containsObject:item])
    {
        [self.items addObject:item];
        item.parentItem = self;
    }
}

- (void)addItems:(NSArray *)items
{
    NSUInteger count = [items count];
    for(NSUInteger i = 0; i < count; i++)
    {
        [self addItem:[items objectAtIndex:i]];
    }
}

- (void)removeItem:(id<XSGroupItem>)item
{
    if(item && [self.items containsObject:item])
    {
        [self.items removeObject:item];
        item.parentItem = nil;
    }
}

- (BOOL)containItem:(id<XSGroupItem>)item
{
    if(item)
    {
        return [self.items containsObject:item];
    }
    
    return NO;
}

- (NSUInteger)itemCount
{
    return [self.items count];
}

- (id<XSGroupItem>)itemAtIndex:(NSUInteger)index
{
    if(index < [self itemCount])
    {
        return [self.items objectAtIndex:index];
    }
    
    return nil;
}

- (id<XSGroupItem>)lastItem
{
    return [self.items lastObject];
}

- (void)addItem:(id<XSGroupItem>)item elseRemoveItem:(id<XSGroupItem>)oldItem
{
    if(item && ![self containItem:item])
    {
        [self addItem:item];
    }
    else if(item == nil)
    {
        [self removeItem:oldItem];
    }
}

- (void)removeAllItem
{
    for(id<XSGroupItem> item in self.items)
    {
        item.parentItem = nil;
    }
    
    [self.items removeAllObjects];
}

- (void)removeItemAtIndexes:(NSIndexSet *)indexes
{
    [self.items removeObjectsAtIndexes:indexes];
}

- (BOOL)removeItemAtIndex:(NSUInteger)index
{
    if(index < [self.items count])
    {
        [self.items removeObjectAtIndex:index];
        return YES;
    }
    
    return NO;
}
@end
