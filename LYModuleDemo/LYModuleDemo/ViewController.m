//
//  ViewController.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import "ViewController.h"
#import "CommonModulePageDataSource.h"
#import "LYCollectionModuleLayoutViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //请求模块数据
    [self requestModulePageData];
}

#pragma mark - Module Config

- (id<LYModulePageDataSource>)modulePageDataSource
{
    if (!_modulePageDataSource) {
        _modulePageDataSource = [[CommonModulePageDataSource alloc] init];
        _modulePageDataSource.moduleControllerFactory = [self moduleControllerFactory];
    }
    return _modulePageDataSource;
}

- (LYModuleControllerFactory *)moduleControllerFactory
{
    return [LYModuleControllerFactory sharedModuleControllerFactory];
}

- (UIViewController<LYModuleLayoutViewController> *)moduleLayoutViewController
{
    if (!_moduleLayoutViewController) {
        _moduleLayoutViewController = [[LYCollectionModuleLayoutViewController alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        _moduleLayoutViewController.moduleControllerFactory = [self moduleControllerFactory];
        _moduleLayoutViewController.moduleViewController = self;
    }
    return _moduleLayoutViewController;
}

@end
