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
@property (weak, nonatomic, readwrite) UIScrollView * contentView;
@end
@implementation JKBaseViewModelAdapter

@synthesize moduleController = _moduleController;
@synthesize contentView = _contentView;

- (NSBundle *)defaultBundle {
    return [NSBundle mainBundle];
}
- (void)customInitialization
{
    [self initialization];
    UITableView * tableView = (UITableView *)_contentView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor clearColor];
    tableView.estimatedRowHeight = 44.0;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.tableHeaderView = [[UIView alloc]init];
    tableView.tableFooterView = [[UIView alloc]init];
}
- (void)initialization {
    
}

- (void)registerCellWithReuseIdentifier:(NSString *)identifier {
    
}

- (void)reloadData { 
    UITableView * tableView = (UITableView *)_contentView;
    [tableView reloadData];
}


- (void)reloadWithData:(id)data { 
    
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    return nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return 0;
}



@end

JKBaseViewModelAdapter * AdapterForTableViewMake(__weak UIViewController * moduleController, __weak UITableView *tableView){
    JKBaseViewModelAdapter * adapter = [[JKBaseViewModelAdapter alloc]init];
    adapter.moduleController = moduleController;
    adapter.contentView = tableView;
    [adapter initialization];
    return adapter;
    
}

