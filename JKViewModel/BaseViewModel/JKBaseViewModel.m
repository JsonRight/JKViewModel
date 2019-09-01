//
//  JKBaseViewModel.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "JKBaseViewModel.h"

@interface JKBaseViewModel()

@property (weak, nonatomic, readwrite) UIViewController* _Nullable moduleController;

@property (weak, nonatomic, readwrite) id<JKModuleDelegate> _Nullable moduleDataSource;

@property (copy, nonatomic, readwrite) NSString * _Nullable viewModelID;

@property (copy, nonatomic, readwrite) NSString * _Nullable cellID;

@end

@implementation JKBaseViewModel
//@synthesize viewModelID = _viewModelID;
//@synthesize moduleController = _moduleController;
//@synthesize adapter = _adapter;
//@synthesize data = _data;

- (NSBundle * _Nullable)defaultBundle {
    return [NSBundle mainBundle];
}

- (void)registerCell {
    [self registerCellWithBundle:[self defaultBundle]];
}

- (void)registerCellWithBundle:(NSBundle * _Nullable)bundle {
    if ([self.moduleDataSource respondsToSelector:@selector(registerCellWithforCellReuseIdentifier:inBundle:)]) {
        [self.moduleDataSource registerCellWithforCellReuseIdentifier:self.cellID inBundle:bundle];
    }
}

+ (instancetype _Nullable)viewModelWithModule:(UIViewController * _Nullable)moduleController moduleDataSource:(id<JKModuleDelegate> _Nullable)moduleDataSource {
    JKBaseViewModel * viewModel = [[self alloc] init];
    viewModel.moduleController = moduleController;
    viewModel.moduleDataSource = moduleDataSource;
    [viewModel registerCell];
    return viewModel;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return nil;
}


- (void)reloadData{
    if ([self.moduleDataSource respondsToSelector:@selector(reloadData)]) {
        [self.moduleDataSource reloadData];
    }
}

- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    if ([self.moduleDataSource respondsToSelector:@selector(reloadSections:withRowAnimation:)]) {
        [self.moduleDataSource reloadSections:sections withRowAnimation:animation];
    }
}

- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath*> *_Nullable)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    if ([self.moduleDataSource respondsToSelector:@selector(reloadRowsAtIndexPaths:withRowAnimation:)]) {
        [self.moduleDataSource reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    }
}

@end
