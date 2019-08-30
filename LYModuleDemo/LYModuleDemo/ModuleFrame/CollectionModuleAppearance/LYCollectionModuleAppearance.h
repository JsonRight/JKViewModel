//
//  LYCollectionModuleAppearance.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleAppearance.h"
#import "LYCollectionModuleLayoutViewController.h"

@protocol PCModuleLayoutViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol LYCollectionModuleAppearance <LYModuleAppearance>

@property (nonatomic, weak) LYCollectionModuleLayoutViewController *collectionModuleLayoutViewController;

/*
 模块中items的个数
 */
- (NSInteger)numberOfItemsInModule;

/*
 返回对应index的item
 */
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index;

/*
 item的大小
 */
- (CGSize)sizeForItemAtIndex:(NSInteger)index;

/*
 注册View
 */
- (void)registerViewForModule;

@optional

/*
 模块的inset
 */
- (UIEdgeInsets)insetForModule;

/*
 最小行距
 */
- (CGFloat)minimumLineSpacingForModule;

/*
 最小列间距
 */
- (CGFloat)minimumInteritemSpacingForModule;

/*
 footer size
 */
- (CGSize)referenceSizeForFooterInModule;

/*
 Header size
 */
- (CGSize)referenceSizeForHeaderInModule;

/*
 Supplementary View
 */
- (UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)kind atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
