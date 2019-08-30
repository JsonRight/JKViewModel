//
//  JKViewModelAdapterDelegate.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JKViewModelDataSource.h"
@protocol JKViewModelAdapterDelegate <NSObject>

- (void)initialization;


@property (weak, nonatomic, readonly) UIViewController* moduleController;

@property (weak, nonatomic, readonly) UIView * contentView;
/**
 模块数据
 */
@property (strong, nonatomic) id<JKViewModelDataSource> data;

- (void)reloadData;

- (void)reloadWithData:(id<JKViewModelDataSource>)data;

@end
