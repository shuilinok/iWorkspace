//
//  XSLineTextTabBar.m
//  XSSPH
//
//  Created by shuilin on 2018/5/23.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSLineTextTabBar.h"

@interface XSLineTextTabBar ()

@property (strong, nonatomic) UIImageView *imageView;

@property (weak, nonatomic) XSTouchLabel *selectedLabel;

@end

@implementation XSLineTextTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:imageView];
        imageView.backgroundColor = [XSColorHelper colorWithRGB:0xfc655e];
        
        self.imageView = imageView;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self updateLine];
}

- (void)tabSelected:(XSTouchLabel *)label
{
    self.selectedLabel = label;
    
    [self updateLine];
}

- (void)updateLine
{
    XSTouchLabel *label = self.selectedLabel;
    
    CGRect frame = label.frame;
    
    CGFloat height = 2;
    CGFloat y = frame.origin.y + frame.size.height - height;
    CGFloat width = 66;
    CGFloat x = frame.origin.x + (frame.size.width - width) / 2;
    
    CGRect rect = CGRectMake(x, y, width, height);
    
    self.imageView.frame = rect;
    
    [self bringSubviewToFront:self.imageView];
}

@end
