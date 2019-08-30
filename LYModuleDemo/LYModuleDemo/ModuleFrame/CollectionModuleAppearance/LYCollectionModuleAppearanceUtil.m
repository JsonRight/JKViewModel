//
//  LYCollectionModuleAppearanceUtil.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/29.
//  Copyright © 2019 ly. All rights reserved.
//

#import "LYCollectionModuleAppearanceUtil.h"
#import "LYModuleCell.h"

@implementation LYCollectionModuleAppearanceUtil

+ (NSUInteger)sectionForModuleAppearance:(id<LYCollectionModuleAppearance>)appearance
{
    NSUInteger section = NSNotFound;
    NSArray *moduleAppearanceArray = appearance.collectionModuleLayoutViewController.moduleAppearanceArray;
    if ([moduleAppearanceArray count] > 0) {
        section = [moduleAppearanceArray indexOfObject:appearance];
    }
    return section;
}

+ (void)reloadModuleWithAppearance:(id<LYCollectionModuleAppearance>)appearance
{
    NSUInteger section = [self sectionForModuleAppearance:appearance];
    if (section == NSNotFound) {
        return;
    }
    
    [appearance.collectionModuleLayoutViewController.collectionView reloadSections:[NSIndexSet indexSetWithIndex:section]];
}

+ (void)updateModuleWithAppearance:(id<LYCollectionModuleAppearance>)appearance
{
    NSInteger section = [self sectionForModuleAppearance:appearance];
    if (section == NSNotFound) {
        return;
    }
    
    NSInteger itemsNumber = 0;
    if ([appearance respondsToSelector:@selector(numberOfItemsInModule)]) {
        itemsNumber = [appearance numberOfItemsInModule];
    }
    
    for (NSInteger idx = 0; idx < itemsNumber; idx++) {
        if ([appearance respondsToSelector:@selector(updateItemAtIndex:)]) {
            [appearance updateItemAtIndex:idx];
        }
    }
}

+ (void)updateItemAtIndex:(NSInteger)index withAppearance:(id<LYCollectionModuleAppearance>)appearance
{
    NSInteger section = [self sectionForModuleAppearance:appearance];
    if (section != NSNotFound) {
        return;
    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:section];
    UICollectionView *collectionView = appearance.collectionModuleLayoutViewController.collectionView;
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    if ([cell conformsToProtocol:@protocol(LYModuleCell)]) {
        UICollectionViewCell<LYModuleCell> *moduleCell = (UICollectionViewCell<LYModuleCell> *)cell;
        id moduleInfo = [appearance.moduleController.moduleData.dlist objectAtIndex:index];
        if (moduleInfo && [moduleCell respondsToSelector:@selector(updateCellWithModuleInfo:)]) {
            [moduleCell updateCellWithModuleInfo:moduleInfo];
        }
    }
}

+ (void)performUpdatesArray:(NSArray<LYModuleUpdateItem *> *)array completion:(void (^)(BOOL))completion withAppearance:(id<LYCollectionModuleAppearance>)appearance
{
    NSInteger section = [self sectionForModuleAppearance:appearance];
    if (section == NSNotFound) {
        return;
    }
    
    UICollectionView *collectionView = appearance.collectionModuleLayoutViewController.collectionView;
    [collectionView performBatchUpdates:^{
        NSMutableArray<NSIndexPath *> *deleteIndexPaths = [[NSMutableArray alloc] init];
        NSMutableArray<NSIndexPath *> *insertIndexPaths = [[NSMutableArray alloc] init];
        
        [array enumerateObjectsUsingBlock:^(LYModuleUpdateItem *updateItem, NSUInteger idx, BOOL * _Nonnull stop) {
            if (updateItem.updateAction == LYModuleUpdateActionDelete) {
                [deleteIndexPaths addObject:[NSIndexPath indexPathForItem:updateItem.indexBeforeUpdate inSection:section]];
            } else if (updateItem.updateAction == LYModuleUpdateActionInsert) {
                [insertIndexPaths addObject:[NSIndexPath indexPathForItem:updateItem.indexAfterUpdate inSection:section]];
            } else if (updateItem.updateAction == LYModuleUpdateActionMove) {
                [collectionView moveItemAtIndexPath:[NSIndexPath indexPathForItem:updateItem.indexBeforeUpdate inSection:section] toIndexPath:[NSIndexPath indexPathForItem:updateItem.indexAfterUpdate inSection:section]];
            }
        }];
        
        if ([deleteIndexPaths count] > 0) {
            [collectionView deleteItemsAtIndexPaths:deleteIndexPaths];
        }
        
        if ([insertIndexPaths count] > 0) {
            [collectionView insertItemsAtIndexPaths:insertIndexPaths];
        }
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}

@end
