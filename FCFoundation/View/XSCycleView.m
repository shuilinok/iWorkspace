//
//  XSCycleView.m
//  XSSPH
//
//  Created by shuilin on 2018/6/6.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSCycleView.h"

@interface XSCycleView ()

@property (nonatomic, assign) CGFloat progress;

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@property (nonatomic, strong) CALayer *gradientLayer;

@end

@implementation XSCycleView

- (void)drawProgress:(CGFloat )progress
{
    _progress = progress;
    [_progressLayer removeFromSuperlayer];
    [_gradientLayer removeFromSuperlayer];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //[self drawCycleProgress];
    
    [self drawSimpleProgress];
}

- (void)drawSimpleProgress
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();//获取上下文
    
    CGFloat x = self.bounds.size.width / 2;
    CGFloat y = self.bounds.size.height / 2;
    CGPoint center = CGPointMake(x, y);  //设置圆心位置
    CGFloat radius = x - self.progressWidth;  //设置半径
    CGFloat startA = - M_PI_2;  //圆起点位置
    CGFloat endA = -M_PI_2 + M_PI * 2 * _progress;  //圆终点位置
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    CGContextSetLineWidth(ctx, self.progressWidth); //设置线条宽度
    [self.progressColor setStroke]; //设置描边颜色
    
    CGContextAddPath(ctx, path.CGPath); //把路径添加到上下文
    
    CGContextStrokePath(ctx);  //渲染
    
}

- (void)drawCycleProgress
{
    CGPoint center = CGPointMake(100, 100);
    CGFloat radius = 90;
    CGFloat startA = - M_PI_2;  //设置进度条起点位置
    CGFloat endA = -M_PI_2 + M_PI * 2 * _progress;  //设置进度条终点位置
    
    
    //获取环形路径（画一个圆形，填充色透明，设置线框宽度为10，这样就获得了一个环形）
    _progressLayer = [CAShapeLayer layer];//创建一个track shape layer
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [[UIColor clearColor] CGColor];  //填充色为无色
    _progressLayer.strokeColor = [[UIColor redColor] CGColor]; //指定path的渲染颜色,这里可以设置任意不透明颜色
    _progressLayer.opacity = 1; //背景颜色的透明度
    _progressLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
    _progressLayer.lineWidth = 10;//线的宽度
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];//上面说明过了用来构建圆形
    _progressLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
    [self.layer addSublayer:_progressLayer];
    //生成渐变色
    _gradientLayer = [CALayer layer];
    
    //左侧渐变色
    CAGradientLayer *leftLayer = [CAGradientLayer layer];
    leftLayer.frame = CGRectMake(0, 0, self.bounds.size.width / 2, self.bounds.size.height);    // 分段设置渐变色
    leftLayer.locations = @[@0.3, @0.9, @1];
    leftLayer.colors = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor greenColor].CGColor];
    [_gradientLayer addSublayer:leftLayer];
    
    //右侧渐变色
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake(self.bounds.size.width / 2, 0, self.bounds.size.width / 2, self.bounds.size.height);
    rightLayer.locations = @[@0.3, @0.9, @1];
    rightLayer.colors = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor redColor].CGColor];
    [_gradientLayer addSublayer:rightLayer];
    
    [self.layer setMask:_progressLayer]; //用progressLayer来截取渐变层
    [self.layer addSublayer:_gradientLayer];
}


@end
