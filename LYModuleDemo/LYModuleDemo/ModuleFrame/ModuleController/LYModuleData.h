//
//  LYModuleData.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LYModuleData <NSObject>

/**
 模块ID
 */
@property (strong, nonatomic) NSString *tid;

/**
 模块items数据
 */
@property (strong, nonatomic) NSArray *dlist;

@end

NS_ASSUME_NONNULL_END
