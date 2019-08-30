//
//  LYModuleViewController.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYModulePageDataSource.h"
#import "LYModuleController.h"
#import "LYModuleLayoutViewController.h"
#import "LYModuleControllerFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYModuleViewController : UIViewController
{
    LYModuleControllerFactory *_moduleControllerFactory;
    id<LYModulePageDataSource> _modulePageDataSource;
    UIViewController<LYModuleLayoutViewController> *_moduleLayoutViewController;
}

/**
 模块组装工厂
 */
@property (nonatomic, strong) LYModuleControllerFactory *moduleControllerFactory;

/**
 模块页面数据源
 */
@property (nonatomic, strong) id<LYModulePageDataSource> modulePageDataSource;

/**
 moduleController列表
 */
@property (nonatomic, strong) NSArray<LYModuleController *> *moduleControllerList;

/**
 模块展示子viewContrlller
 */
@property (nonatomic, strong) UIViewController<LYModuleLayoutViewController> *moduleLayoutViewController;

/**
 请求模块页面数据
 */
- (void)requestModulePageData;

@end

NS_ASSUME_NONNULL_END
