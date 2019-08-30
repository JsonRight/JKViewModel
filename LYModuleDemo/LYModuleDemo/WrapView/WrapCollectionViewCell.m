//
//  WrapCollectionViewCell.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import "WrapCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation WrapCollectionViewCell

- (void)setWrapContentView:(UIView<WrapContentView> *)wrapContentView
{
    if (_wrapContentView == wrapContentView) {
        return;
    }
    
    // 清理wrapContentView和之前Cell的联系
    UIView *aView = wrapContentView.superview.superview;
    if ([aView isKindOfClass:[self class]]) {
        WrapCollectionViewCell *preWrapCell = (WrapCollectionViewCell *)aView;
        [preWrapCell cleanWrapContentView];
    }
    
    [_wrapContentView removeFromSuperview];
    _wrapContentView = wrapContentView;
    if (wrapContentView) {
        [self.contentView addSubview:wrapContentView];
        
        // 设置约束
        [wrapContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
}

- (void)setWrapContentData:(id)wrapContentData
{
    if ([self.wrapContentView conformsToProtocol:@protocol(WrapContentView)]) {
        self.wrapContentView.wrapContentData = wrapContentData;
    }
}

- (id)wrapContentData
{
    id data = nil;
    if ([self.wrapContentView conformsToProtocol:@protocol(WrapContentView)]) {
        data = self.wrapContentView.wrapContentData;
    }
    return data;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    if ([self.wrapContentView respondsToSelector:@selector(prepareForReuse)]) {
        [self.wrapContentView prepareForReuse];
    }
}

- (void)cleanWrapContentView
{
    [_wrapContentView removeFromSuperview];
    _wrapContentView = nil;
}

@end
