//
//  CoverView.h
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CoverViewDataSource.h"
#import "WrapContentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoverView : UIView <WrapContentView>

@property (nonatomic, weak) IBOutlet UIImageView *coverImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;

@property (nonatomic, strong) id<CoverViewDataSource> dataSource;

@end

NS_ASSUME_NONNULL_END
