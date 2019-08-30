//
//  ADCollectionModuleAppearance.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/29.
//  Copyright © 2019 ly. All rights reserved.
//

#import "ADCollectionModuleAppearance.h"
#import "CoverViewDataSource.h"
#import "WrapCollectionViewCell.h"
#import "LYCollectionModuleAppearanceUtil.h"

#define ADCollectionViewCellIdentifier @"ADCollectionViewCellIdentifier"

@implementation ADCollectionModuleAppearance

- (NSInteger)numberOfItemsInModule
{
    NSInteger number = [self.moduleController.moduleData.dlist count];
    return  number > 0 ? 1 : 0;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    id<CoverViewDataSource> info = [self.moduleController.moduleData.dlist objectAtIndex:index];
    UICollectionView *collectionView = self.collectionModuleLayoutViewController.collectionView;
    NSInteger section = [self.collectionModuleLayoutViewController.moduleAppearanceArray indexOfObject:self];
    WrapCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ADCollectionViewCellIdentifier forIndexPath:[NSIndexPath indexPathForItem:index inSection:section]];
    if (!cell.wrapContentView) {
        UINib *nib = [UINib nibWithNibName:@"ADCover" bundle:nil];
        NSArray *array = [nib instantiateWithOwner:nil options:nil];
        cell.wrapContentView = [array objectAtIndex:0];
    }
    cell.wrapContentData = info;
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    return CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 200.f);
}

- (void)registerViewForModule
{
    UICollectionView *collectionView = self.collectionModuleLayoutViewController.collectionView;
    [collectionView registerClass:[WrapCollectionViewCell class] forCellWithReuseIdentifier:ADCollectionViewCellIdentifier];
}

- (void)reloadModule
{
    [LYCollectionModuleAppearanceUtil reloadModuleWithAppearance:self];
}

- (void)performUpdatesArray:(NSArray<LYModuleUpdateItem *> *)array completion:(void (^)(BOOL))completion
{
    [LYCollectionModuleAppearanceUtil performUpdatesArray:array completion:completion withAppearance:self];
}

- (void)deepRefreshModule
{
    [self.moduleController requestModuleData];
}

@end
