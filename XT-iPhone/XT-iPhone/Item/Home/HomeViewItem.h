//
//  HomeViewItem.h
//  XT-iPhone
//
//  Created by shuilin on 2018/6/25.
//  Copyright © 2018年 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchHistoryTableViewItem.h"

@interface HomeViewItem : NSObject

- (instancetype)init:(id)context;

@property (strong, nonatomic) XSProtocolCommand *clickHistoryKeyCommand;

@property (readonly, strong, nonatomic) NSError *error;

@property (readonly, strong, nonatomic) SearchHistoryTableViewItem *historyTableViewItem;

@property (readonly, strong, nonatomic) SearchHistoryTableCellItem *lastCellItem;

- (void)onLoadHistory:(dispatch_block_t)callback;

@end


@interface HomeViewItem ()

@property (strong, nonatomic) NSError *error;

@property (strong, nonatomic) SearchHistoryTableViewItem *historyTableViewItem;

@property (strong, nonatomic) SearchHistoryTableCellItem *lastCellItem;

@property (weak, nonatomic) id context;

@end
