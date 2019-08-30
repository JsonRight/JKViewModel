//
//  LYModuleControllerFactory.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleController.h"
@protocol LYCollectionModuleAppearance;

NS_ASSUME_NONNULL_BEGIN

@interface LYModuleControllerFactory : NSObject

/**
 生成单例

 @return 单例LYModuleControllerFactory
 */
+ (instancetype)sharedModuleControllerFactory;

/**
 根据模块信息生成ModuleData

 @param dict 模块信息
 @return ModuleData对象
 */
- (id<LYModuleData>)moduleDataWithInfo:(NSDictionary *)dict;

/**
 根据模块信息生成ModuleDataListSource

 @param dict 模块信息
 @return ModuleDataListSource对象
 */
- (id<LYModuleDataListSource>)moduleDataListSourceWithInfo:(NSDictionary *)dict;

/**
 根据模块信息生成ModuleActionResponder

 @param moduleController moduleController对象
 @return ModuleActionResponder对象
 */
- (id<LYModuleActionResponder>)moduleActionResponderForModuleController:(LYModuleController *)moduleController;

/**
 根据模块信息生成collectionModuleAppearance

 @param moduleController moduleController对象
 @return collectionModuleAppearance对象
 */
- (id<LYCollectionModuleAppearance>)collectionModuleAppearanceForModuleController:(LYModuleController *)moduleController;

/**
 根据ModuleData生成ModuleController对象

 @param moduleData ModuleData对象
 @return ModuleController对象
 */
- (LYModuleController *)moduleControllerForModuleData:(id<LYModuleData>)moduleData;

/**
 根据ModuleData列表生成ModuleController列表

 @param moduleDataArray ModuleData列表
 @param reusableModuleControllerArray 可重用的moduleController Array。如果reusableModuleControllerArray中有ModuleController的ModuleData和moduleDataArray中的ModuleData相等，则使用这个可重用的ModuleController而不新建
 @return ModuleController列表
 */
- (NSArray<LYModuleController *> *)moduleControllerArrayForModuleDataArray:(NSArray<id<LYModuleData>> *)moduleDataArray withReusableModuleControllerArray:(NSArray<LYModuleController *> *)reusableModuleControllerArray;

@end

NS_ASSUME_NONNULL_END
