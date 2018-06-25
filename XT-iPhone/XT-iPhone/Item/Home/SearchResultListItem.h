//
//  SearchResultListItem.h
//  MVVM
//
//  Created by shuilin on 06/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "FGTableViewItem.h"
#import "SearchResultCellItem.h"
#import "DMItemNotification.h"

@interface SearchResultListItem : FGTableViewItem

@property (strong, nonatomic) NSString *key;

@property (readonly, assign, nonatomic) BOOL searching;

@property (readonly, assign, nonatomic) BOOL moreLoading;//加载更多

@property (readonly, strong, nonatomic) NSString *tipMessage;

- (void)onSearch;

- (void)onLoadMore;

@end
