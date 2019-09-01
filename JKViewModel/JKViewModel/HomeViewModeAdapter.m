//
//  HomeViewModeAdapter.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/31.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "HomeViewModeAdapter.h"
#import "HomeModuleDataSource.h"
#import "HomeViewModel.h"
#import "Home1ViewModel.h"
@interface HomeViewModeAdapter()
@end
@implementation HomeViewModeAdapter

- (void)initialization{
    [super initialization];
    HomeModuleDataSource* dataSource = [HomeModuleDataSource dataSource:self.moduleController adapter:self];
    HomeViewModel * model = [HomeViewModel viewModelWithModule:dataSource.moduleController moduleDataSource:dataSource];
    Home1ViewModel * model1 = [Home1ViewModel viewModelWithModule:dataSource.moduleController moduleDataSource:dataSource];
    [dataSource renderWithData:[@[model,model1] mutableCopy]];
    [self renderWithDataSourceList:[@[dataSource] mutableCopy]];
//    [self reloadData];
}


@end
