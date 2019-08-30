//
//  LYModuleLayoutViewController.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleControllerFactory.h"
@class LYModuleViewController;
@class LYModuleController;

NS_ASSUME_NONNULL_BEGIN

@protocol LYModuleLayoutViewController <NSObject>

/**
 moduleAppearance列表
 */
@property (nonatomic, strong) NSArray *moduleAppearanceArray;

/**
 模块组装工厂
 */
@property (nonatomic, strong) LYModuleControllerFactory *moduleControllerFactory;

/**
 指向对应的moduleViewController
 */
@property (nonatomic, weak) LYModuleViewController *moduleViewController;

/**
 深度刷新，展示全部模块后，里面的每一个模块都重新请求数据刷新

 @param moduleControllerArray moduleController列表
 */
- (void)deepRefreshWithModuleControllerArray:(NSArray<LYModuleController *> *)moduleControllerArray;

@end

NS_ASSUME_NONNULL_END
