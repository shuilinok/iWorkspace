//
//  XSImageView.m
//  XSSPH
//
//  Created by shuilin on 2018/5/3.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSImageView.h"
#import "UIImageView+WebCache.h"

@implementation XSImageView

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
        self.clipsToBounds = YES;
        self.contentMode = UIViewContentModeScaleToFill;
    }
    
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
    
    [self sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:self.placeHolder];
}

@end
