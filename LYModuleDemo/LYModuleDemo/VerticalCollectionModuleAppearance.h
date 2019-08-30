//
//  VertialCollectionModuleAppearance.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/29.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYCollectionModuleAppearance.h"

NS_ASSUME_NONNULL_BEGIN

@interface VerticalCollectionModuleAppearance : NSObject <LYCollectionModuleAppearance>

@property (nonatomic, strong) LYModuleController *moduleController;
@property (nonatomic, weak) LYCollectionModuleLayoutViewController *collectionModuleLayoutViewController;

@end

NS_ASSUME_NONNULL_END
