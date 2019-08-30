//
//  CoverView.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import "CoverView.h"
#import <SDWebImage/SDWebImage.h>

@implementation CoverView

- (void)refreshWithInfo:(id<CoverViewDataSource>)dataSource
{
    if ([dataSource respondsToSelector:@selector(title)]) {
        self.titleLabel.text = dataSource.title;
    }
    
    if ([dataSource respondsToSelector:@selector(subtitle)]) {
        self.subtitleLabel.text = dataSource.subtitle;
    }
    
    if ([dataSource respondsToSelector:@selector(image)]) {
        if ([self.dataSource.image length] > 0) {
            [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:dataSource.image]];
        } else {
            self.coverImageView.image = nil;
        }
    }
}

#pragma mark - WrapContentView

- (void)setWrapContentData:(id)wrapContentData
{
    self.dataSource = wrapContentData;
    [self refreshWithInfo:self.dataSource];
}

- (id)wrapContentData
{
    return self.dataSource;
}

@end
