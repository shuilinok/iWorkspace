//
//  XSTextTabBar.m
//  XSSPH
//
//  Created by shuilin on 2018/5/6.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSTextTabBar.h"

@interface XSTextTabBar ()

@property (strong, nonatomic) NSMutableArray *tabViews;

@end

@implementation XSTextTabBar

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self doInit];
        
        [self build];
    }
    
    return self;
}

- (void)doInit
{
    self.tabViews = [[NSMutableArray alloc] init];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = [self.tabViews count];
    if(count == 0)
    {
        return;
    }
    
    CGFloat x = 0;
    CGFloat width = self.bounds.size.width / count;//平分
    CGFloat height = self.bounds.size.height;
    
    for(XSTouchLabel *v in self.tabViews)
    {
        CGRect frame = CGRectMake(x, 0, width, height);
        v.frame = frame;
        x += width;
    }
}

- (void)build
{
    //先移除掉
    for(UIView *v in self.tabViews)
    {
        [v removeFromSuperview];
    }
    [self.tabViews removeAllObjects];
    
    //加入各个视图
    for(XSTextTabItem *temp in self.item.titleItems)
    {
        temp.normalItem.clickCommand = [XSProtocolCommand command:self selectorName:@"normalLabelClicked:"];
        temp.highItem.clickCommand = [XSProtocolCommand command:self selectorName:@"highLabelClicked:"];
        
        XSTouchLabel *v = [[[NSBundle mainBundle] loadNibNamed:@"XSTouchLabel" owner:self options:nil] lastObject];
        
        [self.tabViews addObject:v];
        //加入到本视图
        [self addSubview:v];
        
        if(temp.selected)
        {
            v.item = temp.highItem;
            [self tabSelected:v];
        }
        else
        {
            v.item = temp.normalItem;
        }
    }
}

- (void)setItem:(XSTextTabBarItem *)item
{
    _item = item;
    
    [self build];
}
//
//- (XSTouchLabel *)labelForTabItem:(XSTextTabItem *)item
//{
//    for(XSTouchLabel *v in self.tabViews)
//    {
//        if(v.item == item.normalItem || v.item == item.highItem)
//        {
//            return v;
//        }
//    }
//
//    return nil;
//}

- (void)normalAll
{
    for(XSTouchLabel *v in self.tabViews)
    {
        XSTextTabItem *tabItem = [self.item tabItemForLabelItem:v.item];
        v.item = tabItem.normalItem;
    }
//
//    for(XSTextTabItem *temp in self.item.titleItems)
//    {
//        XSTouchLabel *v = [self labelForTabItem:temp];
//        v.item = temp.normalItem;
//    }
}

- (id)normalLabelClicked:(id)sender
{
    XSTouchLabel *v = sender;

    [self normalAll];
    
    XSTextTabItem *tabItem = [self.item tabItemForLabelItem:v.item];
    v.item = tabItem.highItem;
    tabItem.selected = YES;
    [self tabSelected:v];
    
    [tabItem.selectCommand execute:1,tabItem];
    
    return nil;
}

- (id)highLabelClicked:(id)sender
{
    //高亮时点击不处理
    
    return nil;
}

- (void)tabSelected:(XSTouchLabel *)label
{
    
}

@end
