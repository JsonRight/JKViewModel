//
//  JKViewModelDataSource.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol JKViewModelDataSource <NSObject>

/**
 模块唯一标识
 */
@property (copy, nonatomic) NSString *viewModelID;

/**
 模块数据
 */
@property (strong, nonatomic) id<JKViewModelDataSource> data;

@property (weak, nonatomic, readonly) UIViewController* moduleController;

@property (weak, nonatomic, readonly) UIView * contentView;

// Override to subView
- (void)registerCellWithReuseIdentifier;

- (void)registerCell;

- (void)registerCellWithBundle: (NSBundle*)bundle;

@optional
// Override to subView
- (NSInteger)numberOfSections;
// Override to subView
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
// Override to subView
- (UIView *)viewForItemAtIndexPath:(NSIndexPath *)indexPath;
// Override to subView
- (void)renderViewWithModel:(id<JKViewModelDataSource>)model;

/**
 请求模块数据
 */
- (void)requestModuleData;


@end

