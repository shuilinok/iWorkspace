//
//  XSWaterCollectionViewLayout.m
//  XSSPH
//
//  Created by shuilin on 2018/6/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSWaterCollectionViewLayout.h"


@interface XSWaterCollectionViewLayout ()
//数组存放每列的总高度
@property(nonatomic,strong)NSMutableArray* colsHeight;
//单元格宽度
@property(nonatomic,assign)CGFloat colWidth;

@property (strong, nonatomic) NSMutableArray *attributes;

@end

@implementation XSWaterCollectionViewLayout

-(void)prepareLayout
{
    [super prepareLayout];
    if(self.column == 0)
    {
        return;
    }
    
    self.colWidth =( self.collectionView.frame.size.width - self.insets.left - self.insets.right - (self.column - 1)*self.inter)/self.column;
    
    self.colsHeight = nil;
    
    
    NSMutableArray* array = [NSMutableArray array];
    
//    //头部视图
//    UICollectionViewLayoutAttributes * layoutHeader = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathWithIndex:0]];
//    layoutHeader.frame =CGRectMake(0,0, self.headerReferenceSize.width, self.headerReferenceSize.height);
//    [array addObject:layoutHeader];
    
    NSInteger items = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i<items;i++) {
        UICollectionViewLayoutAttributes* attr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        if(attr)
        {
            [array addObject:attr];
        }
    }
    
    self.attributes = array;
}

-(CGSize)collectionViewContentSize{
    
    if(self.column == 0)
    {
        return CGSizeZero;
    }
    
    NSNumber * longest = self.colsHeight[0];
    for (NSInteger i =0;i<self.colsHeight.count;i++) {
        NSNumber* rolHeight = self.colsHeight[i];
        if(longest.floatValue<rolHeight.floatValue){
            longest = rolHeight;
        }
    }
    return CGSizeMake(self.collectionView.frame.size.width, longest.floatValue + self.insets.bottom);
    
}

//计算尺寸
- (CGRect)calcFrame:(NSUInteger)index
{
    if(self.column == 0)
    {
        return CGRectZero;
    }
    
    NSNumber * shortest = self.colsHeight[0];
    NSInteger  shortCol = 0;
    for (NSInteger i =0;i<self.colsHeight.count;i++) {
        NSNumber* rolHeight = self.colsHeight[i];
        if(shortest.floatValue>rolHeight.floatValue){
            shortest = rolHeight;
            shortCol=i;
        }
    }
    CGFloat x = self.insets.left + shortCol*self.inter + shortCol * self.colWidth;
    
    CGFloat y = shortest.floatValue+self.lineSpacing;
    if(index / self.column == 0)//第一行
    {
        y -= self.lineSpacing;
        y += self.insets.top;
    }
    
    //获取cell高度
    CGFloat height = [self.delegate heightAtIndex:index waterColectionViewLayout:self];
    
    if(index / self.column == 0)//第一行
    {
        self.colsHeight[shortCol]=@(shortest.floatValue+height + self.insets.top);
    }
    else
    {
        self.colsHeight[shortCol]=@(shortest.floatValue+self.lineSpacing+height);
    }
    
    CGRect frame = CGRectMake(x, y, self.colWidth, height);
    
    return frame;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewLayoutAttributes* attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    if(self.column == 0)
    {
        return attr;
    }

    attr.frame = [self calcFrame:indexPath.row];

    return attr;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    return self.attributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

-(NSMutableArray *)colsHeight{
    
    if(!_colsHeight){
        NSMutableArray * array = [NSMutableArray array];
        for(int i =0;i<self.column;i++){
            //这里可以设置初始高度
            [array addObject:@(0)];
        }
        _colsHeight = [array mutableCopy];
    }
    return _colsHeight;
}

- (void)clearHeight
{
    self.colsHeight = nil;
}
@end
