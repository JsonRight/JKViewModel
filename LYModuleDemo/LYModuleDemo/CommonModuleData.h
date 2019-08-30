//
//  CommonModuleData.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYModuleData.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommonModuleData : NSObject <LYModuleData>

@property (strong, nonatomic) NSString *tid;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *dlist;

@end

NS_ASSUME_NONNULL_END
