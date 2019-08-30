//
//  NSObject+ModuleDataListSource.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleDataListSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ModuleDataListSource)
@property (nonatomic, strong, nullable) id<LYModuleDataListSource> ly_moduleDataListSource;
@end

NS_ASSUME_NONNULL_END
