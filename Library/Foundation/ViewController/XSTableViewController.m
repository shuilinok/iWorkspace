//
//  XSTableViewController.m
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSTableViewController.h"
#import "XSProtocolCommand.h"

@interface XSTableViewController ()

@end

@implementation XSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSUInteger count = [self.item itemCount];
    
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    XSTableSectionItem *sectionItem = [self.item itemAtIndex:section];
    
    NSUInteger count = [sectionItem itemCount];
    
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XSTableSectionItem *sectionItem = [self.item itemAtIndex:indexPath.section];
    XSTableCellItem *cellItem = [sectionItem itemAtIndex:indexPath.row];
    
    if(cellItem.createViewCommand == nil)
    {
        abort();
    }
    
    UITableViewCell *cell = [cellItem.createViewCommand execute:3,tableView,indexPath,cellItem];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XSTableSectionItem *sectionItem = [self.item itemAtIndex:indexPath.section];
    XSTableCellItem *cellItem = [sectionItem itemAtIndex:indexPath.row];
    
    [cellItem.selectCommand execute:3,tableView,indexPath,cellItem];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XSTableSectionItem *sectionItem = [self.item itemAtIndex:indexPath.section];
    XSTableCellItem *cellItem = [sectionItem itemAtIndex:indexPath.row];
    
    return cellItem.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    XSTableSectionItem *sectionItem = [self.item itemAtIndex:section];
    
    return sectionItem.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    XSTableSectionItem *sectionItem = [self.item itemAtIndex:section];
    
    return sectionItem.footerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    XSTableSectionItem *sectionItem = [self.item itemAtIndex:section];
    
    UIView *view = [sectionItem.createFooterViewCommand execute:3,tableView,@(section),sectionItem];
    
    return view;
}

@end
