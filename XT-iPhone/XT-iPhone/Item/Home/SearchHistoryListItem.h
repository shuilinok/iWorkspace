//
//  SearchHistoryListItem.h
//  MVVM
//
//  Created by shuilin on 06/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "FGTableViewItem.h"
#import "SearchHistoryCellItem.h"
#import "DMItemNotification.h"

@interface SearchHistoryListItem : FGTableViewItem

@property (strong, nonatomic) NSString *keyToAdd;

- (void)onLoad;

- (void)onAdd;

- (void)onClear;

@end
