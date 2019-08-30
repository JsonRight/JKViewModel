//
//  LYCollectionModuleAppearanceUtil.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/29.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYCollectionModuleAppearance.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYCollectionModuleAppearanceUtil : NSObject

/**
 获取appearancec所在section

 @param appearance 模块appearances
 @return appearancec所在section
 */
+ (NSUInteger)sectionForModuleAppearance:(id<LYCollectionModuleAppearance>)appearance;

/**
 重新加载整个模块

 @param appearance 模块appearances
 */
+ (void)reloadModuleWithAppearance:(id<LYCollectionModuleAppearance>)appearance;

/**
 刷新当前模块
 注意，前提条件是当前Module的dlist和刷新前的isEqual，不同的只是内部细节；否则，用reloadModule

 @param appearance 模块appearances
 */
+ (void)updateModuleWithAppearance:(id<LYCollectionModuleAppearance>)appearance;

/**
 更新一个item UI
 注意，使用前提条件是当前的ModuleInfo和之前的ModuleInfo isEqual，不同的只是内部细节;否则，不建议用这个刷新

 @param index cell所在index
 @param appearance 模块appearances
 */
+ (void)updateItemAtIndex:(NSInteger)index withAppearance:(id<LYCollectionModuleAppearance>)appearance;

/**
 模块内部的inset delete move

 @param array ModuleUpdateItem array
 @param completion 完成回调
 @param appearance 模块appearances
 */
+ (void)performUpdatesArray:(NSArray<LYModuleUpdateItem *> *)array completion:(void (^)(BOOL))completion withAppearance:(id<LYCollectionModuleAppearance>)appearance;

@end

NS_ASSUME_NONNULL_END
