//
//  LYModuleUpdateItem.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LYModuleUpdateAction) {
    LYModuleUpdateActionNone,
    LYModuleUpdateActionInsert,
    LYModuleUpdateActionDelete,
    LYModuleUpdateActionReload,
    LYModuleUpdateActionMove
};

NS_ASSUME_NONNULL_BEGIN

@interface LYModuleUpdateItem : NSObject

@property (nonatomic, assign) NSInteger indexBeforeUpdate;
@property (nonatomic, assign) NSInteger indexAfterUpdate;
@property (nonatomic, assign) LYModuleUpdateAction updateAction;

@end

NS_ASSUME_NONNULL_END

