//
//  JKViewModelAdapterDelegate.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JKViewModelAdapterDelegate <NSObject>

- (void)initialization;

- (NSBundle*)defaultBundle;

@property (weak, nonatomic, readonly) UIViewController* moduleController;

@property (weak, nonatomic, readonly) UIScrollView * contentView;

- (void)registerCellWithReuseIdentifier:(NSString *)identifier;

- (void)reloadData;

- (void)reloadWithData:(id)data;

@end
