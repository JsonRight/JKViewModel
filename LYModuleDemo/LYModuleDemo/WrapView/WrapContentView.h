//
//  WrapContentView.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WrapContentView <NSObject>

/**
 数据Entity
 */
@property (nonatomic, strong) id wrapContentData;

@optional

- (void)prepareForReuse;

@end

NS_ASSUME_NONNULL_END

