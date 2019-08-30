//
//  LYModuleActionResponder.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol LYModuleData;
@protocol LYModuleAppearance;

NS_ASSUME_NONNULL_BEGIN

@protocol LYModuleActionResponder <NSObject>

@optional

- (void)didSelectItemAtIndex:(NSInteger)index
            moduleAppearance:(id<LYModuleAppearance>)moduleAppearance
              viewController:(UIViewController *)viewController;

- (void)willDisplayCell:(UICollectionViewCell *)cell
                atIndex:(NSInteger)index
       moduleAppearance:(id<LYModuleAppearance>)moduleAppearance
         viewController:(UIViewController *)viewController;

- (void)didEndDisplayCell:(UICollectionViewCell *)cell
                  atIndex:(NSInteger)index
         moduleAppearance:(id<LYModuleAppearance>)moduleAppearance
           viewController:(UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
