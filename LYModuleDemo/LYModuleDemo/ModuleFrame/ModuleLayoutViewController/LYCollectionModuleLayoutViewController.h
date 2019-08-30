//
//  LYCollectionModuleLayoutViewController.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYModuleLayoutViewController.h"
@protocol LYCollectionModuleAppearance;

NS_ASSUME_NONNULL_BEGIN

@interface LYCollectionModuleLayoutViewController : UICollectionViewController <LYModuleLayoutViewController>

@property (nonatomic, strong) NSArray<id<LYCollectionModuleAppearance>> *moduleAppearanceArray;
@property (nonatomic, strong) LYModuleControllerFactory *moduleControllerFactory;
@property (nonatomic, weak) LYModuleViewController *moduleViewController;

@end

NS_ASSUME_NONNULL_END
