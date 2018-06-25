//
//  XSTextTabBar.h
//  XSSPH
//
//  Created by shuilin on 2018/5/6.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSTextTabBarItem.h"
#import "XSTouchLabel.h"

@interface XSTextTabBar : UIView

@property (strong, nonatomic) XSTextTabBarItem *item;

@end


@interface XSTextTabBar ()

- (void)tabSelected:(XSTouchLabel *)label;

@end
