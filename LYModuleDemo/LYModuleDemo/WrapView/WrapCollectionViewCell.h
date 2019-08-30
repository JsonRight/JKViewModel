//
//  WrapCollectionViewCell.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WrapContentView.h"

NS_ASSUME_NONNULL_BEGIN

/**
 将一个View封装为UICollectionViewCell
 */
@interface WrapCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView<WrapContentView> *wrapContentView;
@property (nonatomic, strong) id wrapContentData;

@end

NS_ASSUME_NONNULL_END
