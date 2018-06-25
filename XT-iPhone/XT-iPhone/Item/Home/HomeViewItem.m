//
//  HomeViewItem.m
//  XT-iPhone
//
//  Created by shuilin on 2018/6/25.
//  Copyright © 2018年 shuilin. All rights reserved.
//

#import "HomeViewItem.h"
#import "QuerySearchKeysRequest.h"

@implementation HomeViewItem

- (instancetype)init:(id)context
{
    self = [super init];
    if(self)
    {
        self.context = context;
    }
    
    return self;
}

- (void)onLoadHistory:(dispatch_block_t)callback
{
    QuerySearchKeysRequest *request = [[QuerySearchKeysRequest alloc] init];
    
    [request send:^{
       
        if(request.error.code != noErr)
        {
            SearchHistoryTableViewItem *item = [[SearchHistoryTableViewItem alloc] init:self];
            item.keys = request.keys;
            [item commit];
            
            self.historyTableViewItem = item;
            
        }
        else
        {
            self.error = request.error;
        }
   
        callback();
    }];

}

@end
