//
//  JKTableViewBaseAdapterProtocol.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JKBaseViewModelProtocol.h"
#import "JKModuleDataSourceProtocol.h"

@protocol JKTableViewBaseAdapterProtocol <UITableViewDataSource ,UITableViewDelegate>

+ (instancetype _Nullable )adapterWithModule:(UIViewController*_Nullable)moduleController tableView: (UITableView*_Nullable)tableView;

@property (weak, nonatomic, readonly) UIViewController* _Nullable moduleController;

@property (weak, nonatomic, readonly) UITableView * _Nullable tableView;

@property (strong, nonatomic, readonly) NSMutableArray<JKModuleDataSourceProtocol>* _Nullable dataSourceList;

- (void)initialization;

- (void)reloadData;

- (void)renderWithDataSourceList:(NSMutableArray<JKModuleDataSourceProtocol>* _Nullable)dataSourceList;


@end

