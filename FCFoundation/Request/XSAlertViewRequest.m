//
//  XSAlertViewRequest.m
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSAlertViewRequest.h"
#import <UIKit/UIKit.h>

@interface XSAlertViewRequest ()

//选择的是第几个
@property (assign, nonatomic) NSInteger selectedIndex;

@property (copy, nonatomic) XSCallback callback;

@end


@implementation XSAlertViewRequest

- (void)send:(XSCallback)callback
{
    self.callback = callback;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:UIAlertControllerStyleAlert];
    
    if([self.items count] == 0)//没有制定，就展示一个取消按钮
    {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            if(self.callback)
            {
                self.callback();
                self.callback = nil;
            }
            
        }];
        
        [alert addAction:cancelAction];
    }
    else
    {
        for(XSAlertViewItem *item in self.items)
        {
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:item.title style:item.style handler:^(UIAlertAction *action) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if(self.callback)
                    {
                        self.selectedIndex = [self.items indexOfObject:item];
                        self.callback();
                        self.callback = nil;
                    }
                    
                });
                
            }];
            
            [alert addAction:okAction];
        }
    }
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIViewController *controller = self.presentController;
        
        [controller presentViewController:alert animated:YES completion:nil];
    });
    
}
@end
