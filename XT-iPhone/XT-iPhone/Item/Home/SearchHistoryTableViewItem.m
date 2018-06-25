//
//  SearchHistoryTableViewItem.m
//  XT-iPhone
//
//  Created by shuilin on 2018/6/25.
//  Copyright © 2018年 shuilin. All rights reserved.
//

#import "SearchHistoryTableViewItem.h"

@implementation SearchHistoryTableViewItem

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
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    for(NSString *key in self.keys)
    {
        SearchHistoryTableCellItem *cellItem = [[SearchHistoryTableCellItem alloc] init:self.context];
        cellItem.title = key;
        [cellItem commit];
        
        [items addObject:cellItem];
        
        [self.context setValue:cellItem forKey:@"lastCellItem"];
    }
}

@end
