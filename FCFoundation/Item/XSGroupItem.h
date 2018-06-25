//
//  XSGroupItem.h
//  XSSPH
//
//  Created by shuilin on 2018/4/28.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>


//组合
@protocol XSGroupItem <NSObject>

@optional

@property (weak, nonatomic) id<XSGroupItem> parentItem;

- (void)addItem:(id<XSGroupItem>)item;

- (void)addItems:(NSArray *)items;//批量

- (void)removeItem:(id<XSGroupItem>)item;

- (BOOL)containItem:(id<XSGroupItem>)item;

- (NSUInteger)itemCount;

- (id<XSGroupItem>)itemAtIndex:(NSUInteger)index;

- (id<XSGroupItem>)lastItem;

- (void)addItem:(id<XSGroupItem>)item elseRemoveItem:(id<XSGroupItem>)oldItem;

- (void)removeAllItem;

- (void)removeItemAtIndexes:(NSIndexSet *)indexes;

- (BOOL)removeItemAtIndex:(NSUInteger)index;

@end


@interface XSGroupItem : NSObject <XSGroupItem>

@property (weak, nonatomic) id<XSGroupItem> parentItem;

@end
