//
//  SearchHistoryTableCellItem.h
//  XT-iPhone
//
//  Created by shuilin on 2018/6/25.
//  Copyright © 2018年 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeViewItem;

@interface SearchHistoryTableCellItem : NSObject

- (instancetype)init:(id)context;

@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) BOOL hidden;

@property (strong, nonatomic) XSProtocolCommand *clickCommand;

@property (strong, nonatomic) NSString *title;

- (void)commit;

@end

@interface SearchHistoryTableCellItem ()

@property (weak, nonatomic) id context;

@end
