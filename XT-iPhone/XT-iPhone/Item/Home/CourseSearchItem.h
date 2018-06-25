//
//  CourseSearchItem.h
//  MVVM
//
//  Created by shuilin on 02/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchResultListItem.h"
#import "SearchHistoryListItem.h"

@interface CourseSearchItem : NSObject

@property (strong, nonatomic) NSString *searchText;

@property (readonly, strong, nonatomic) SearchResultListItem *resultListItem;

@property (readonly, strong, nonatomic) SearchHistoryListItem *historyListItem;

- (void)onSearch;

@end
