//
//  VertialCollectionModuleAppearance.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/29.
//  Copyright © 2019 ly. All rights reserved.
//

#import "VerticalCollectionModuleAppearance.h"
#import "CoverViewDataSource.h"
#import "WrapCollectionViewCell.h"
#import "CommonUIDefine.h"
#import "HeaderCollectionReusableView.h"
#import "CommonModuleData.h"

#define VerticalCollectionViewCellIdentifier @"VerticalCollectionViewCellIdentifier"

@implementation VerticalCollectionModuleAppearance

- (NSInteger)numberOfItemsInModule
{
    return [self.moduleController.moduleData.dlist count];
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    id<CoverViewDataSource> info = [self.moduleController.moduleData.dlist objectAtIndex:index];
    UICollectionView *collectionView = self.collectionModuleLayoutViewController.collectionView;
    NSInteger section = [self.collectionModuleLayoutViewController.moduleAppearanceArray indexOfObject:self];
    WrapCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:VerticalCollectionViewCellIdentifier forIndexPath:[NSIndexPath indexPathForItem:index inSection:section]];
    if (!cell.wrapContentView) {
        UINib *nib = [UINib nibWithNibName:@"VerticalCover" bundle:nil];
        NSArray *array = [nib instantiateWithOwner:nil options:nil];
        cell.wrapContentView = [array objectAtIndex:0];
    }
    cell.wrapContentData = info;
    return cell;
}

- (UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)kind atIndex:(NSInteger)index
{
    UICollectionReusableView *view = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionView *collectionView = self.collectionModuleLayoutViewController.collectionView;
        NSInteger section = [self.collectionModuleLayoutViewController.moduleAppearanceArray indexOfObject:self];
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderCollectionReusableViewIdentifier forIndexPath:[NSIndexPath indexPathForItem:index inSection:section]];
        
        CommonModuleData *moduleData = self.moduleController.moduleData;
        headerView.titleLabel.text = moduleData.title;
        view = headerView;
    }
    return view;
}

- (CGSize)referenceSizeForHeaderInModule
{
    return CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 50.f);
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    CGFloat width = floor((CGRectGetWidth([UIScreen mainScreen].bounds) - LeftSpace - RightSpace - InteritemSpace * 2) / 3.f);
    return CGSizeMake(width, floor(width * 4.f / 3.f) + 60.f);
}

- (void)registerViewForModule
{
    UICollectionView *collectionView = self.collectionModuleLayoutViewController.collectionView;
    [collectionView registerClass:[WrapCollectionViewCell class] forCellWithReuseIdentifier:VerticalCollectionViewCellIdentifier];
    [collectionView registerNib:[UINib nibWithNibName:@"HeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderCollectionReusableViewIdentifier];
}

- (CGFloat)minimumInteritemSpacingForModule
{
    return InteritemSpace;
}

- (CGFloat)minimumLineSpacingForModule
{
    return LineSpace;
}

- (UIEdgeInsets)insetForModule
{
    return UIEdgeInsetsMake(0.f, LeftSpace, BottomSpace, RightSpace);
}

@end
