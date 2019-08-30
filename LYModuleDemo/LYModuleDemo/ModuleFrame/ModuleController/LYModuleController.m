//
//  LYModuleController.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import "LYModuleController.h"
#import "LYModuleUpdateItem.h"

@implementation LYModuleController

- (NSString *)tid
{
    return self.moduleData.tid;
}

- (void)requestModuleData
{
    if ([self.dataListSource respondsToSelector:@selector(requestModuleDataListForModule:)]) {
        [self.dataListSource requestModuleDataListForModule:self.moduleData];
    }
}

#pragma mark - ModuleDataListSourceDelegate

- (void)loadingModuleDataListSucceed:(id<LYModuleDataListSource>)dataListSource dataList:(NSArray *)dlist
{
    NSArray *currentDataList = [NSArray arrayWithArray:self.moduleData.dlist];
    NSSet *dlistSet = [NSSet setWithArray:dlist];
    
    if ([currentDataList isEqualToArray:dlist]) {
        // 数据相同update，避免内部数据变化
        self.moduleData.dlist = [NSArray arrayWithArray:dlist];
        
        if ([self.moduleAppearance respondsToSelector:@selector(updateModule)]) {
            [self.moduleAppearance updateModule];
        }
    } else if ([currentDataList count] == 0 || [dlist count] == 0 || dlist.count != dlistSet.count) {
        // 从无到有、从有到无、有重复数据时reload整个模块
        self.moduleData.dlist = [NSArray arrayWithArray:dlist];
        
        if ([self.moduleAppearance respondsToSelector:@selector(reloadModule)]) {
            [self.moduleAppearance reloadModule];
        }
    } else {
        // 局部增删移动和刷新
        NSMutableArray *updateItems = [NSMutableArray array];
        
        for (NSInteger idx = 0; idx < [currentDataList count]; idx++) {
            id moduleInfo = [currentDataList objectAtIndex:idx];
            NSInteger newIdx = [dlist indexOfObject:moduleInfo];
            
            if (newIdx != idx) {
                // 位置有变化
                LYModuleUpdateItem *updateItem = [[LYModuleUpdateItem alloc] init];
                if (newIdx == NSNotFound) {
                    // 删除
                    updateItem.indexBeforeUpdate = idx;
                    updateItem.updateAction = LYModuleUpdateActionDelete;
                } else {
                    // 移动，标记移动并刷新cell
                    updateItem.indexBeforeUpdate = idx;
                    updateItem.indexAfterUpdate = newIdx;
                    updateItem.updateAction = LYModuleUpdateActionMove;
                    
                    if ([self.moduleAppearance respondsToSelector:@selector(updateItemAtIndex:)]) {
                        [self.moduleAppearance updateItemAtIndex:idx];
                    }
                }
                [updateItems addObject:updateItem];
            } else {
                // 位置相同，刷新cell
                if ([self.moduleAppearance respondsToSelector:@selector(updateItemAtIndex:)]) {
                    [self.moduleAppearance updateItemAtIndex:idx];
                }
            }
        }
        
        for (NSInteger idx = 0; idx < [dlist count]; idx++) {
            id moduleInfo = [dlist objectAtIndex:idx];
            if ([currentDataList indexOfObject:moduleInfo] == NSNotFound) {
                //插入
                LYModuleUpdateItem *updateItem = [[LYModuleUpdateItem alloc] init];
                updateItem.indexAfterUpdate = idx;
                updateItem.updateAction = LYModuleUpdateActionInsert;
                [updateItems addObject:updateItem];
            }
        }
        
        // 更新self.moduleData.dlist必须在局部cell刷新之后，这样cell才是用之前的数据刷新
        self.moduleData.dlist = [NSArray arrayWithArray:dlist];
        
        if ([self.moduleAppearance respondsToSelector:@selector(performUpdatesArray:completion:)]) {
            [self.moduleAppearance performUpdatesArray:updateItems
                                            completion:nil];
        }
    }
}

- (void)loadingModuleDataListFailed:(id<LYModuleDataListSource>)dataListSource failedInfo:(id)failedInfo
{
    if ([self.moduleAppearance respondsToSelector:@selector(updateUIWithInfo:)]) {
        [self.moduleAppearance updateUIWithInfo:failedInfo];
    }
}

- (void)updateModuleDataFinished:(id<LYModuleDataListSource>)dataListSource currentModuleData:(id<LYModuleData>)moduleData
{
    if ([self.moduleAppearance respondsToSelector:@selector(updateModule)]) {
        [self.moduleAppearance updateModule];
    }
}

@end
