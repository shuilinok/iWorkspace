//
//  XSTouchImageView.m
//  XSSPH
//
//  Created by shuilin on 2018/5/5.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSTouchImageView.h"

@interface XSTouchImageView ()<UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)clickButton:(id)sender;

@end

@implementation XSTouchImageView

+ (instancetype)create
{
    XSTouchImageView *v = [[[NSBundle mainBundle] loadNibNamed:@"XSTouchImageView" owner:self options:nil] lastObject];
    
    return v;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    
//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
//    singleTap.delegate = self;
//    [self addGestureRecognizer:singleTap];
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    //[self.touchCommand execute:0];
}

- (IBAction)clickButton:(id)sender
{
    [self.touchCommand execute:1,self];
}
@end
