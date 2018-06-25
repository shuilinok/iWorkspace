//
//  SearchHistoryTableCellItem.m
//  XT-iPhone
//
//  Created by shuilin on 2018/6/25.
//  Copyright © 2018年 shuilin. All rights reserved.
//

#import "SearchHistoryTableCellItem.h"
#import "HomeViewItem.h"

@implementation SearchHistoryTableCellItem

- (instancetype)init:(id)context
{
    self = [super init];
    if(self)
    {
        self.context = context;
    }
    
    return self;
}

- (void)commit
{
    self.height = 44;
    self.clickCommand = [self.context valueForKey:@"clickHistoryKeyCommand"];
}

@end
