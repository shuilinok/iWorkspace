//
//  XSWaterCollectionViewLayout.h
//  XSSPH
//
//  Created by shuilin on 2018/6/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <UIKit/UIKit.h>

//竖直瀑布流

@class XSWaterCollectionViewLayout;

@protocol XSWaterCollectionViewLayoutDelegate <NSObject>

//指定每个Cell的高度
- (CGFloat)heightAtIndex:(NSUInteger)index waterColectionViewLayout:(XSWaterCollectionViewLayout *)layout;

@end

@interface XSWaterCollectionViewLayout : UICollectionViewFlowLayout

//四个边距
@property (assign, nonatomic) UIEdgeInsets insets;

//列数
@property (assign, nonatomic) NSUInteger column;

//cell横间距
@property (assign, nonatomic) CGFloat inter;

//cell行间距
@property (assign, nonatomic) CGFloat lineSpacing;

@property (weak, nonatomic) id<XSWaterCollectionViewLayoutDelegate> delegate;

//计算第index个cell的尺寸
- (CGRect)calcFrame:(NSUInteger)index;

//清空已有的高度
- (void)clearHeight;

@end
