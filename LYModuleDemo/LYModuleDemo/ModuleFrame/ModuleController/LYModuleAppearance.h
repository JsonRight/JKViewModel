//
//  LYModuleAppearance.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleUpdateItem.h"
@class LYModuleController;

NS_ASSUME_NONNULL_BEGIN

@protocol LYModuleAppearance <NSObject>

/**
 对应的ModuleController
 */
@property (nonatomic, strong) LYModuleController *moduleController;

@optional

/**
 刷新模块
 若需要请求dlist数据，需要在这个方法里请求
 */
- (void)deepRefreshModule;

#pragma mark - Updata UI When Data Change

/**
 重新加载整个模块
 */
- (void)reloadModule;

/**
 刷新当前模块
 注意，前提条件是当前ModuleData的dlist和刷新前的isEqual，不同的只是内部细节；否则，用reloadModule
 */
- (void)updateModule;

/**
 更新一个item UI
 注意，使用前提条件是当前的ModuleItemInfo和之前的ModuleItemInfo isEqual，不同的只是内部细节;否则，不建议用这个刷新

 @param index item index
 */
- (void)updateItemAtIndex:(NSInteger)index;

/**
 模块内部BatchUpdates

 @param array 更新标记
 @param completion 结束回调
 */
- (void)performUpdatesArray:(NSArray<LYModuleUpdateItem *> *)array completion:(void (^_Nullable)(BOOL finished))completion;

/**
 特殊情况的刷新

 @param info 刷新数据
 */
- (void)updateUIWithInfo:(id)info;

@end

NS_ASSUME_NONNULL_END

