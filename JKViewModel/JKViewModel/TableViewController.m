//
//  TableViewController.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/31.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "TableViewController.h"
#import "HomeViewModeAdapter.h"
#import "HomeViewModel.h"
@interface TableViewController ()
@property (nonatomic, strong) HomeViewModeAdapter* adapter;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adapter = [HomeViewModeAdapter adapterWithModule:self tableView:self.tableView];
}

@end
