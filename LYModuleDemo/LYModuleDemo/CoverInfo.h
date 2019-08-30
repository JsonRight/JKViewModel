//
//  CoverInfo.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoverView/CoverViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoverInfo : NSObject <CoverViewDataSource>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *jumpLink;

@end

NS_ASSUME_NONNULL_END

