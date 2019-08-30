//
//  LYModuleDataListSource.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleData.h"

NS_ASSUME_NONNULL_BEGIN
@protocol LYModuleDataListSource;

@protocol LYModuleDataListSourceDelegate <NSObject>

@optional

/**
 请求模块数据成功

 @param dataListSource 模块数据源
 @param dlist 完整的dataList数据
 */
- (void)loadingModuleDataListSucceed:(id<LYModuleDataListSource>)dataListSource dataList:(NSArray *)dlist;

/**
 请求模块数据失败

 @param dataListSource 模块数据源
 @param failedInfo 失败信息
 */
- (void)loadingModuleDataListFailed:(id<LYModuleDataListSource>)dataListSource failedInfo:(id)failedInfo;

/**
 更新模块数据成功

 @param dataListSource 模块数据源
 @param moduleData 当前的ModuleData
 */
- (void)updateModuleDataFinished:(id<LYModuleDataListSource>)dataListSource currentModuleData:(id<LYModuleData>)moduleData;

@end


@protocol LYModuleDataListSource <NSObject>

@property (nonatomic, weak) id<LYModuleDataListSourceDelegate> delegate;

@optional

/**
 解析模块数据

 @param dict 模块数据dict
 @return ModuleData对象
 */
- (id<LYModuleData>)parseModuleDataWithDictionary:(NSDictionary *)dict;

/**
 请求ModuleDataList

 @param moduleData 所在的ModuleData
 */
- (void)requestModuleDataListForModule:(id<LYModuleData>)moduleData;


/**
 两个ModuleData相等时，用新ModuleData更新当前的ModuleData

 @param currentModuleData 当前的ModuleData
 @param moduleData 新ModuleData
 */
- (void)updateModuleData:(id<LYModuleData>)currentModuleData withModuleData:(id<LYModuleData>)moduleData;

@end

NS_ASSUME_NONNULL_END
