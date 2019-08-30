//
//  CoverModuleDataListSource.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleDataListSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoverModuleDataListSource : NSObject <LYModuleDataListSource>

@property (nonatomic, weak) id<LYModuleDataListSourceDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
