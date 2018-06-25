//
//  CourseSearchItem.m
//  MVVM
//
//  Created by shuilin on 02/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "CourseSearchItem.h"
#import "AddSearchKeyRequest.h"

@interface CourseSearchItem ()  

@property (strong, nonatomic) SearchResultListItem *resultListItem;

@property (strong, nonatomic) SearchHistoryListItem *historyListItem;

@end


@implementation CourseSearchItem

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        SearchResultListItem *item = [[SearchResultListItem alloc] init];
        self.resultListItem = item;
        
        SearchHistoryListItem *historyListItem = [[SearchHistoryListItem alloc] init];
        self.historyListItem = historyListItem;
    }
    
    return self;
}

- (void)onSearch
{
    self.resultListItem.key = self.searchText;
    [self.resultListItem onSearch];
    
    self.historyListItem.keyToAdd = self.searchText;
    [self.historyListItem onAdd];
}

@end
