//
//  XSImageView.h
//  XSSPH
//
//  Created by shuilin on 2018/5/3.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <UIKit/UIKit.h>

//支持展示网络图片的视图
@interface XSImageView : UIImageView

@property (strong, nonatomic) NSString *imageUrl;

@property (strong, nonatomic) UIImage *placeHolder;

@property (strong, nonatomic) UIImage *brokenImage;

@end
