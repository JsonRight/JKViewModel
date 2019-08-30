//
//  LYModuleCell.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/30.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LYModuleCell <NSObject>

- (void)updateCellWithModuleInfo:(id)moduleInfo;

@end

NS_ASSUME_NONNULL_END
