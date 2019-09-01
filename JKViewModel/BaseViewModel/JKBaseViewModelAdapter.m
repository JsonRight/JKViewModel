//
//  JKBaseViewModelAdapter.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "JKBaseViewModelAdapter.h"
@interface JKBaseViewModelAdapter()
@property (weak, nonatomic, readwrite) UIViewController * moduleController;
@property (weak, nonatomic, readwrite) UITableView * tableView;
@property (strong, nonatomic, readwrite) NSMutableArray<JKModuleDataSourceProtocol>* _Nullable dataSourceList;

@end
@implementation JKBaseViewModelAdapter

@synthesize moduleController = _moduleController;
@synthesize tableView = _tableView;


- (void)customInitialization{
    [self initialization];
   
}
- (void)initialization {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableHeaderView = [[UIView alloc]init];
    self.tableView.tableFooterView = [[UIView alloc]init];
}

+ (instancetype _Nullable)adapterWithModule:(UIViewController * _Nullable)moduleController tableView:(UITableView * _Nullable)tableView {
    JKBaseViewModelAdapter * adapter = [[self alloc] init];
    adapter.moduleController = moduleController;
    adapter.tableView = tableView;
    [adapter initialization];
    return adapter;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)registerCellWithforCellReuseIdentifier:(NSString*_Nullable)identifier inBundle: (NSBundle*_Nullable)bundle {
    if (identifier.length<=0) return;
    NSURL* urlOfNib = [bundle URLForResource:identifier withExtension:@"nib"];
    if (urlOfNib) {
        UINib* nib = [UINib nibWithNibName:identifier bundle:bundle];
        [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
    } else {
        id cellClass = NSClassFromString(identifier);
        if (cellClass) {
            [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
        }
    }
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (void)renderWithDataSourceList:(NSMutableArray<JKModuleDataSourceProtocol> * _Nullable)dataSourceList {
    self.dataSourceList = dataSourceList;
}


- (void)reloadRowAtIndexPath:(NSArray<NSIndexPath *> * _Nullable)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)reloadSections:(NSIndexSet * _Nullable)sections withRowAnimation:(UITableViewRowAnimation)animation {
    [self.tableView reloadSections:sections withRowAnimation:animation];
}

- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> * _Nullable)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.dataSourceList[indexPath.section] tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSourceList[section] numberOfRowsInSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSourceList.count;
}

@end
