//
//  XSCollectionViewController.m
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSCollectionViewController.h"
#import "XSProtocolCommand.h"

@interface XSCollectionViewController ()

@end

@implementation XSCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)setItem:(XSCollectionViewItem *)item
{
    _item = item;
    
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    NSUInteger count = [self.item itemCount];
    
    return count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    XSCollectionSectionItem *sectionItem = [self.item itemAtIndex:section];
    
    NSUInteger count = [sectionItem itemCount];
    
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell
    XSCollectionSectionItem *sectionItem = [self.item itemAtIndex:indexPath.section];
    XSCollectionCellItem *cellItem = [sectionItem itemAtIndex:indexPath.row];
    
    UICollectionViewCell *cell;
    
    if(cellItem.createViewCommand == nil)
    {
        abort();
    }
    
    cell = [cellItem.createViewCommand execute:3,collectionView,indexPath,cellItem];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    XSCollectionSectionItem *sectionItem = [self.item itemAtIndex:indexPath.section];
    XSCollectionCellItem *cellItem = [sectionItem itemAtIndex:indexPath.row];
    
    if(cellItem.selectCommand == nil)
    {
        NSLog(@"警告：没有指定选择命令");
    }
    
    [cellItem.selectCommand execute:3,collectionView,indexPath,cellItem];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XSCollectionSectionItem *sectionItem = [self.item itemAtIndex:indexPath.section];
    XSCollectionCellItem *cellItem = [sectionItem itemAtIndex:indexPath.row];
    
    return cellItem.size;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    XSCollectionSectionItem *sectionItem = [self.item itemAtIndex:section];
    
    return sectionItem.insets;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    XSCollectionSectionItem *sectionItem = [self.item itemAtIndex:section];
    
    return sectionItem.minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    XSCollectionSectionItem *sectionItem = [self.item itemAtIndex:section];
    
    return sectionItem.minimumInteritemSpacing;
}

@end
