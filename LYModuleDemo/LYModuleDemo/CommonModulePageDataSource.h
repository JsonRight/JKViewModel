//
//  CommonModulePageDataSource.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModulePageDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommonModulePageDataSource : NSObject <LYModulePageDataSource>

@property (nonatomic, strong) LYModuleControllerFactory *moduleControllerFactory;
@property (nonatomic, strong) NSMutableArray *moduleDataList;

@end

NS_ASSUME_NONNULL_END
