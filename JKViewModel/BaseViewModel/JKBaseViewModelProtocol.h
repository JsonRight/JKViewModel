//
//  JKBaseViewModelProtocol.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JKModuleDelegate.h"

@protocol JKBaseViewModelProtocol <NSObject>

+ (instancetype _Nullable )viewModelWithModule:(UIViewController*_Nullable)moduleController moduleDataSource: (id<JKModuleDelegate>_Nullable)moduleDataSource;

@property (weak, nonatomic, readonly) UIViewController* _Nullable moduleController;

@property (weak, nonatomic, readonly) id<JKModuleDelegate> _Nullable moduleDataSource;

@property (copy, nonatomic, readonly) NSString * _Nullable viewModelID;

@property (copy, nonatomic, readonly) NSString * _Nullable cellID;

@property (strong, nonatomic) id _Nullable data;

@property (strong, nonatomic) NSIndexPath * _Nullable indexPath;

// Override to subView
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath;

@end


