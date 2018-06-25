//
//  SearchResultListItem.m
//  MVVM
//
//  Created by shuilin on 06/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "SearchResultListItem.h"
#import "DMCourseSearchRequest.h"
#import "DMItemNotification.h"

@interface SearchResultListItem ()

@property (assign, nonatomic) BOOL searching;

@property (assign, nonatomic) BOOL moreLoading;//加载更多

@property (strong, nonatomic) NSString *tipMessage;

@property (assign, nonatomic) NSUInteger offset;

@end


@implementation SearchResultListItem

- (void)onSearch
{
    NSString *key = self.key;
    
    if(key.length == 0)
    {
        self.tipMessage = @"请输入课程名称";
        return;
    }
    
    self.offset = 0;
    
    DMCourseSearchRequest *request = [[DMCourseSearchRequest alloc] init];
    request.offset = self.offset;
    request.limit = 12;
    request.key = key;
    
    self.searching = YES;
    
    [request send:^(NSError *error) {
        
        self.searching = NO;
        
        if(error.code == noErr)
        {
            NSArray *infos = request.infos;
            
            if(infos.count > 0)
            {
                [self removeAllItem];
                
                XTSectionItem *sectionItem = [[XTSectionItem alloc] init];
                [self addItem:sectionItem];
                NSArray *cellItems = [self createCellItems:infos];
                [sectionItem addItems:cellItems];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:kCourseSearchLoadNotification object:self userInfo:nil];
                
                self.offset += [infos count];
            }
            else
            {
                self.tipMessage = @"没有搜索到内容";
            }
        }
        else
        {
            self.tipMessage = @"搜索发生错误";
        }
    }];
}

- (void)onLoadMore
{
    NSString *key = self.key;
    
    if(key.length == 0)
    {
        self.tipMessage = @"缺少课程名称";
        return;
    }
    
    DMCourseSearchRequest *request = [[DMCourseSearchRequest alloc] init];
    request.offset = self.offset;
    request.limit = 6;
    request.key = key;
    
    self.moreLoading = YES;
    
    [request send:^(NSError *error) {
        
        self.moreLoading = NO;
        
        if(error.code == noErr)
        {
            NSArray *infos = request.infos;
            
            if(infos.count > 0)
            {
                XTSectionItem *sectionItem = [self itemAtIndex:0];
                
                NSArray *cellItems = [self createCellItems:infos];
                NSArray *indexPaths = [self createMoreIndexPaths:cellItems];
                
                //计算indexPaths后再加入
                [sectionItem addItems:cellItems];
                
                //抛通知
                if([indexPaths count] > 0)
                {
                    [[NSNotificationCenter defaultCenter] postNotificationName:kCourseSearchLoadMoreNotification object:self userInfo:@{@"indexPaths":indexPaths}];
                }
                
                self.offset += [infos count];
            }
            else
            {
                self.tipMessage = @"没有更多了";
            }
        }
        else
        {
            self.tipMessage = @"加载发生错误";
        }
    }];
}

- (NSArray *)createCellItems:(NSArray *)infos
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    for(SearchCourseInfo *info in infos)
    {
        SearchResultCellItem *cellItem = [[SearchResultCellItem alloc] init];
        [items addObject:cellItem];
        
        cellItem.title = info.name;
        cellItem.desc = [NSString stringWithFormat:@"院校：%@",info.org_name];
        cellItem.imageUrl = info.thumbImageUrl;
        cellItem.getCellSelectorName = @"searchResultCellItem:getCell:tableView:";
        cellItem.clickCellSelectorName = @"clickSearchResultCellItem:";
        cellItem.height = 60;
    }
    
    return items;
}

- (NSArray *)createMoreIndexPaths:(NSArray *)items
{
    XTSectionItem *sectionItem = [self itemAtIndex:0];
    NSUInteger end = [sectionItem itemCount];
    
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    NSUInteger count = [items count];
    for(NSUInteger i = 0 ; i < count; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:end + i inSection:0];
        
        [indexPaths addObject:indexPath];
    }
    return indexPaths;
}


@end


