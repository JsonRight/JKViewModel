//
//  CoverViewDataSource.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CoverViewDataSource <NSObject>

@optional

- (NSString *)title;
- (NSString *)subtitle;
- (NSString *)image;

@end

NS_ASSUME_NONNULL_END

