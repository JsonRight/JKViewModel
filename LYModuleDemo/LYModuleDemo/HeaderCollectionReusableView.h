//
//  HeaderCollectionReusableView.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/29.
//  Copyright © 2019 ly. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HeaderCollectionReusableViewIdentifier @"HeaderCollectionReusableViewIdentifier"

NS_ASSUME_NONNULL_BEGIN

@interface HeaderCollectionReusableView : UICollectionReusableView

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
