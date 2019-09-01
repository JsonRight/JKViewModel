//
//  JKModuleDataSourceProtocol.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/9/1.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JKBaseViewModelProtocol.h"
#import "JKModuleDelegate.h"

@protocol JKModuleDataSourceProtocol <NSObject>

+ (instancetype _Nullable )dataSource:(UIViewController*_Nullable)moduleController adapter: (id<JKModuleDelegate>_Nullable)adapter;

@property (weak, nonatomic, readonly) UIViewController* _Nullable moduleController;

@property (weak, nonatomic, readonly) id<JKModuleDelegate> _Nullable adapter;

@property (copy, nonatomic, readonly) NSString * _Nullable moduleID;

@property (assign, nonatomic, readonly) NSInteger section;

@property (strong, nonatomic) NSMutableArray<JKBaseViewModelProtocol> *_Nullable moduleData;

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (void)renderWithData:(NSMutableArray<JKBaseViewModelProtocol>* _Nullable)data;

@optional
- (void)requestModulePageDataWithSuccessBlock:(void (^_Nullable)(id<JKModuleDataSourceProtocol> _Nullable dataSource))successBlock
                                  failedBlock:(void (^_Nullable)(id<JKModuleDataSourceProtocol> _Nullable dataSource, NSError * _Nullable error))failedBlock;

- (void)cleanData;


@end


