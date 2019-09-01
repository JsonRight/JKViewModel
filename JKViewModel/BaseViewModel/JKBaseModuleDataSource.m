//
//  JKBaseModuleDataSource.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/9/1.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "JKBaseModuleDataSource.h"

@interface JKBaseModuleDataSource()

@property (weak, nonatomic, readwrite) UIViewController* _Nullable moduleController;

@property (weak, nonatomic, readwrite) id<JKModuleDelegate> _Nullable adapter;

@property (copy, nonatomic, readwrite) NSString * _Nullable moduleID;

@property (assign, nonatomic, readwrite) NSInteger section;

@property (strong, nonatomic, readwrite) NSMutableArray<JKBaseViewModelProtocol> *_Nullable moduleData;


@end
@implementation JKBaseModuleDataSource

+ (instancetype _Nullable )dataSource:(UIViewController*_Nullable)moduleController adapter: (id<JKModuleDelegate>_Nullable)adapter{
    JKBaseModuleDataSource * dataSource = [[self alloc] init];
    dataSource.moduleController = moduleController;
    dataSource.adapter = adapter;
    return dataSource;
}

// Override to subView
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    id <JKBaseViewModelProtocol> item = self.moduleData[indexPath.row];
    item.indexPath = indexPath;
    return [item tableView:tableView cellForRowAtIndexPath:indexPath];
}
// Override to subView
- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    self.section = section;
    return self.moduleData.count;
}

- (void)renderWithData:(NSMutableArray* _Nullable)data{
    self.moduleData = data;
}

- (void)reloadData{
    if ([self.adapter respondsToSelector:@selector(reloadData)]) {
        [self.adapter reloadData];
    }
}

- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    if ([self.adapter respondsToSelector:@selector(reloadSections:withRowAnimation:)]) {
        [self.adapter reloadSections:sections withRowAnimation:animation];
    }
}

- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    if ([self.adapter respondsToSelector:@selector(reloadRowsAtIndexPaths:withRowAnimation:)]) {
        [self.adapter reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    }
}

- (void)registerCellWithforCellReuseIdentifier:(NSString * _Nullable)identifier inBundle:(NSBundle * _Nullable)bundle {
    if ([self.adapter respondsToSelector:@selector(reloadData)]) {
        [self.adapter registerCellWithforCellReuseIdentifier:identifier inBundle:bundle];
    }
}


@end
