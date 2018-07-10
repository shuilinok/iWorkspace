//
//  XSCycleView.h
//  XSSPH
//
//  Created by shuilin on 2018/6/6.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSCycleView : UIView

//进度条颜色
@property (strong, nonatomic) UIColor *progressColor;

@property (assign, nonatomic) CGFloat progressWidth;

- (void)drawProgress:(CGFloat )progress;

@end
