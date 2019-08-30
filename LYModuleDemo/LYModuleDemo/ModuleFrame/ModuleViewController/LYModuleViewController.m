//
//  LYModuleViewController.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import "LYModuleViewController.h"

@interface LYModuleViewController ()

@end

@implementation LYModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 若该页面存在moduleLayoutViewController，添加子viewController
    if (self.moduleLayoutViewController) {
        [self addChildViewController:self.moduleLayoutViewController];
        [self.view addSubview:self.moduleLayoutViewController.view];
        [self.moduleLayoutViewController didMoveToParentViewController:self];

        [self.view insertSubview:self.moduleLayoutViewController.view atIndex:0];
    }
}

- (LYModuleControllerFactory *)moduleControllerFactory
{
    // 默认为LYModuleControllerFactory
    return [LYModuleControllerFactory sharedModuleControllerFactory];
}

#pragma mark - RequestModulePageData

- (void)requestModulePageData
{
    if (![self.modulePageDataSource respondsToSelector:@selector(requestModulePageDataWithSuccessBlock:failedBlock:)]) {
        return;
    }
    
    if ([self.modulePageDataSource respondsToSelector:@selector(cleanData)]) {
        [self.modulePageDataSource cleanData];
    }
    
    __weak typeof(self) weakSelf = self;
    [self.modulePageDataSource requestModulePageDataWithSuccessBlock:^(id<LYModulePageDataSource>  _Nonnull dataSource) {
        typeof(self) strongSelf = weakSelf;
        [strongSelf requestModulePageDataSuccess];
    } failedBlock:^(id<LYModulePageDataSource>  _Nonnull dataSource, NSError * _Nonnull error) {
        typeof(self) strongSelf = weakSelf;
        [strongSelf requestModulePageDataFailedWithError:error];
    }];
}

- (void)requestModulePageDataSuccess
{
    [self updateModuleControllerList];
    [self deepRefreshModuleLayoutViewController];
    [self updateUIAfterRequestModulePageDataSuccess];
}

- (void)requestModulePageDataFailedWithError:(NSError *)error
{
    [self updateUIAfterRequestModulePageDataFailedWithError:error];
}

- (void)updateModuleControllerList
{
    if (![self.modulePageDataSource respondsToSelector:@selector(moduleDataList)]) {
        return;
    }
    
    self.moduleControllerList = [self.moduleControllerFactory moduleControllerArrayForModuleDataArray:self.modulePageDataSource.moduleDataList withReusableModuleControllerArray:self.moduleControllerList];
}

- (NSArray *)choseModuleControllersForLayoutViewControllerFromModuleControllerList:(NSArray *)modules
{
    //子类实现，默认全部模块在moduleLayoutViewController中按顺序展示
    return modules;
}

- (void)deepRefreshModuleLayoutViewController
{
    if (![self.moduleLayoutViewController respondsToSelector:@selector(deepRefreshWithModuleControllerArray:)]) {
        return;
    }
    
    NSArray *moduleControllerList = [self choseModuleControllersForLayoutViewControllerFromModuleControllerList:self.moduleControllerList];
    [self.moduleLayoutViewController deepRefreshWithModuleControllerArray:moduleControllerList];
}

- (void)updateUIAfterRequestModulePageDataSuccess
{
    // 子类根据情况重载
}

- (void)updateUIAfterRequestModulePageDataFailedWithError:(NSError *)error
{
    // 子类根据情况重载
}

@end

