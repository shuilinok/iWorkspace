//
//  SearchHistoryTableViewItem.h
//  XT-iPhone
//
//  Created by shuilin on 2018/6/25.
//  Copyright © 2018年 shuilin. All rights reserved.
//

#import "SearchHistoryTableCellItem.h"

@interface SearchHistoryTableViewItem : NSObject

- (instancetype)init:(id)context;

@property (strong, nonatomic) NSArray *keys;

- (void)commit;

@end


@interface SearchHistoryTableViewItem ()

@property (weak, nonatomic) id context;

@end
