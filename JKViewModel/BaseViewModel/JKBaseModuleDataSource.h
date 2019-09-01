//
//  JKBaseModuleDataSource.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/9/1.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKModuleDataSourceProtocol.h"
#import "JKBaseViewModelProtocol.h"
#import "JKModuleDelegate.h"

@interface JKBaseModuleDataSource : NSObject<JKModuleDataSourceProtocol, JKModuleDelegate>

+ (instancetype _Nullable )dataSource:(UIViewController*_Nullable)moduleController adapter: (id<JKModuleDelegate>_Nullable)adapter;

@property (weak, nonatomic, readonly) UIViewController * _Nullable moduleController;

@property (weak, nonatomic, readonly) id<JKModuleDelegate> _Nullable adapter;

@property (copy, nonatomic, readonly) NSString * _Nullable moduleID;

@property (assign, nonatomic, readonly) NSInteger section;

@property (strong, nonatomic, readonly) NSMutableArray<JKBaseViewModelProtocol> *_Nullable moduleData;

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (void)renderWithData:(NSMutableArray<JKBaseViewModelProtocol>* _Nullable)data;

@end
