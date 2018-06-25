//
//  SearchHistoryListItem.m
//  MVVM
//
//  Created by shuilin on 06/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "SearchHistoryListItem.h"
#import "AddSearchKeyRequest.h"
#import "QuerySearchKeysRequest.h"
#import "ClearSearchKeysRequest.h"

@implementation SearchHistoryListItem

- (void)onLoad
{
    QuerySearchKeysRequest *sRequest = [[QuerySearchKeysRequest alloc] init];
    [sRequest send:^(NSError *error) {
        
        [self reloadItems:sRequest.keys];
        
    }];
}

- (void)onAdd
{
    NSString *key = self.keyToAdd;
    if(key.length == 0)
    {
        return;
    }
    
    AddSearchKeyRequest *request = [[AddSearchKeyRequest alloc] init];
    request.key = key;
    [request send:^(NSError *error) {
        
        QuerySearchKeysRequest *sRequest = [[QuerySearchKeysRequest alloc] init];
        [sRequest send:^(NSError *error) {
           
            [self reloadItems:sRequest.keys];
            
        }];
    }];
}
                          
- (void)reloadItems:(NSArray *)keys
{
    [self removeAllItem];
    
    if([keys count] > 0)
    {
        XTSectionItem *sectionItem = [[XTSectionItem alloc] init];
        NSArray *cellItems = [self createCellItems:keys];
        [sectionItem addItems:cellItems];
        [self addItem:sectionItem];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kCourseHistoryLoadNotification object:self userInfo:nil];
}

- (NSArray *)createCellItems:(NSArray *)keys
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    for(NSString *key in keys)
    {
        SearchHistoryCellItem *cellItem = [[SearchHistoryCellItem alloc] init];
        cellItem.height = 44;
        cellItem.title = key;
        cellItem.getCellSelectorName = @"searchHistoryCellItem:getCell:tableView:";
        cellItem.clickCellSelectorName = @"clickSearchHistoryCellItem:";
        
        [items addObject:cellItem];
    }
    
    return items;
}

- (void)onClear
{
    ClearSearchKeysRequest *request = [[ClearSearchKeysRequest alloc] init];
    [request send:^(NSError *error) {
        
        QuerySearchKeysRequest *sRequest = [[QuerySearchKeysRequest alloc] init];
        [sRequest send:^(NSError *error) {
            
            [self reloadItems:sRequest.keys];
            
        }];
        
    }];
}

@end
