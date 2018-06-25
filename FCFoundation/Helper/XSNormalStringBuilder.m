//
//  XSNormalStringBuilder.m
//  XSSPH
//
//  Created by shuilin on 2018/5/7.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSNormalStringBuilder.h"

@implementation XSAttributeTextProperty

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.textColor = [UIColor darkTextColor];
        self.backColor = [UIColor whiteColor];
        self.lineSpacing = 1;
        self.firstLineHeadIndent = 0;
        self.alignment = NSTextAlignmentLeft;
    }
    
    return self;
}
@end

@implementation XSAttributeImageProperty

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.size = CGSizeMake(16, 16);
        self.lineSpacing = 5;
        self.alignment = NSTextAlignmentLeft;
    }
    
    return self;
}

@end


@interface XSNormalStringBuilder ()

@property (strong, nonatomic) NSMutableAttributedString *result;

@end

@implementation XSNormalStringBuilder

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.result = [[NSMutableAttributedString alloc] init];
    }
    
    return self;
}

- (void)appendAttributedText:(NSAttributedString *)attributedText
{
    if(attributedText.length == 0)
    {
        return;
    }
    
    [self.result appendAttributedString:attributedText];
}

- (void)appendText:(NSString *)text property:(XSAttributeTextProperty *)property
{
    if(text.length == 0)
    {
        return;
    }
    
    NSMutableAttributedString *subString;
    subString = [[NSMutableAttributedString alloc] initWithString:text];
    
    if(property)
    {
        NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
        style.alignment = property.alignment;
        style.lineSpacing = property.lineSpacing;
        style.firstLineHeadIndent = property.firstLineHeadIndent;
        [subString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, subString.length)];
        
        if(property.textColor)
        {
            [subString addAttribute:NSForegroundColorAttributeName  //文字颜色
                              value:property.textColor
                              range:NSMakeRange(0, subString.length)];
        }
        if(property.backColor)
        {
            [subString addAttribute:NSBackgroundColorAttributeName  //背景颜色
                              value:property.backColor
                              range:NSMakeRange(0, subString.length)];
        }
        
        if(property.link.length > 0)
        {
            [subString addAttribute:NSLinkAttributeName
                              value:property.link
                              range:NSMakeRange(0, subString.length)];
        }
        
        //字体
        if(property.font)
        {
            [subString addAttribute:NSFontAttributeName value:property.font range:NSMakeRange(0, subString.length)];
        }
        
        //下划线
        if(property.bUnderline)
        {
            [subString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, subString.length)];
        }
        
        //偏移
        if(property.y)
        {
            [subString addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:-[property.y floatValue]] range:NSMakeRange(0, subString.length)];
        }
        
    }
    
    [self.result appendAttributedString:subString];
    
}

- (void)appendImage:(UIImage *)image property:(XSAttributeImageProperty *)property
{
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = image;
    
    // 设置图片大小
    attch.bounds = CGRectMake(property.x, -property.y, property.size.width, property.size.height);
    
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    
    NSMutableAttributedString *temp = [[NSMutableAttributedString alloc] initWithAttributedString:string];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = property.alignment;
    style.lineSpacing = property.lineSpacing;
    [temp addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, temp.string.length)];
    
    [self.result appendAttributedString:temp];
}

- (void)appendLineSpace:(CGFloat)lineSpacing
{
    XSAttributeTextProperty *property = [[XSAttributeTextProperty alloc] init];
    property.lineSpacing = lineSpacing;
    property.backColor = [UIColor clearColor];
    [self appendText:@" " property:property];
    [self appendText:@"\n" property:nil];
}

@end
