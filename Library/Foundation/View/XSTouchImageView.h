//
//  XSTouchImageView.h
//  XSSPH
//
//  Created by shuilin on 2018/5/5.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSTouchImageView : UIView

+ (instancetype)create;

@property (strong, nonatomic) XSProtocolCommand *touchCommand;

@property (strong, nonatomic) UIImage *image;

@end
