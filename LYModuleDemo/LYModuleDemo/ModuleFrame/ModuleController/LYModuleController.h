//
//  LYModuleController.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleData.h"
#import "LYModuleDataListSource.h"
#import "LYModuleAppearance.h"
#import "LYModuleActionResponder.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYModuleController : NSObject <LYModuleDataListSourceDelegate>

/**
 模块唯一标识
 */
@property (nonatomic, strong, readonly) NSString *tid;

/**
 模块数据Entity
 */
@property (nonatomic, strong) id<LYModuleData> moduleData;

/**
 模块dataList数据源
 */
@property (nonatomic, strong) id<LYModuleDataListSource> dataListSource;

/**
 模块用户行为Responder
 */
@property (nonatomic, strong) id<LYModuleActionResponder> moduleActionResponder;

/**
 模块展示，weak属性
 */
@property (nonatomic, weak) id<LYModuleAppearance> moduleAppearance;

/**
 请求模块数据
 */
- (void)requestModuleData;

@end

NS_ASSUME_NONNULL_END
