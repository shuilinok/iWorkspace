//
//  XSTouchLabel.m
//  XSSPH
//
//  Created by shuilin on 2018/5/6.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSTouchLabel.h"

@interface XSTouchLabel ()

@property (strong, nonatomic) IBOutlet UILabel *label;

- (IBAction)clickButton:(id)sender;

@end

@implementation XSTouchLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc
{
    self.item = nil;
}

- (IBAction)clickButton:(id)sender
{
    [self.item.clickCommand execute:1,self];
}


//开始观察
- (void)beginObserve
{
    NSObject *temp = _item;
    [temp addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:NULL];
}

//结束观察
- (void)endObserve
{
    NSObject *temp = _item;
    [temp removeObserver:self forKeyPath:@"text" context:NULL];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(object == self.item)
    {
        //观察到本对象此属性改变
        if([keyPath isEqualToString:@"text"])
        {
            self.label.text = self.item.text;
        }
        
    }
}

- (void)setItem:(XSTouchLabelItem *)item
{
    [self endObserve];
    
    _item = item;
    self.label.text = item.text;
    self.label.font = item.font;
    self.label.textColor = item.textColor;
    
    [self beginObserve];
}
@end
