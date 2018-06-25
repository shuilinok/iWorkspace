//
//  XSNormalStringBuilder.h
//  XSSPH
//
//  Created by shuilin on 2018/5/7.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XSAttributeTextProperty : NSObject

@property (strong, nonatomic) UIColor *textColor;

@property (assign, nonatomic) NSTextAlignment alignment;

@property (strong, nonatomic) UIFont *font;

@property (assign, nonatomic) CGFloat lineSpacing;

@property (assign, nonatomic) CGFloat firstLineHeadIndent;

@property (strong, nonatomic) UIColor *backColor;

@property (strong, nonatomic) NSString *link;//@"clickLink://"

@property (assign, nonatomic) BOOL bUnderline;

@property (assign, nonatomic) NSNumber *y;

@end

@interface XSAttributeImageProperty : NSObject

@property (assign, nonatomic) NSTextAlignment alignment;

@property (assign, nonatomic) CGSize size;

@property (assign, nonatomic) CGFloat x;

@property (assign, nonatomic) CGFloat y;

@property (assign, nonatomic) CGFloat lineSpacing;

@end

@interface XSNormalStringBuilder : NSObject

@property (readonly, strong, nonatomic) NSMutableAttributedString *result;

- (void)appendText:(NSString *)text property:(XSAttributeTextProperty *)property;

- (void)appendImage:(UIImage *)image property:(XSAttributeImageProperty *)property;

- (void)appendAttributedText:(NSAttributedString *)attributedText;

//添加空白距离
- (void)appendLineSpace:(CGFloat)lineSpacing;

@end
