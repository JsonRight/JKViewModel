//
//  LYModulePageDataSource.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleControllerFactory.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LYModulePageDataSource <NSObject>

@property (nonatomic, strong) LYModuleControllerFactory *moduleControllerFactory;

/**
 模块列表
 */
@property (nonatomic, strong) NSMutableArray *moduleDataList;

/**
 请求(第一页)模块数据
 */
- (void)requestModulePageDataWithSuccessBlock:(void (^)(id<LYModulePageDataSource> dataSource))successBlock
                                  failedBlock:(void (^)(id<LYModulePageDataSource> dataSource, NSError *error))failedBlock;

/**
 清除数据，由外部清除，DataSource不负责数据清除
 */
- (void)cleanData;

@end

NS_ASSUME_NONNULL_END

