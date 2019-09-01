//
//  JKBaseViewModel.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKModuleDelegate.h"
#import "JKBaseViewModelProtocol.h"
@interface JKBaseViewModel : NSObject <JKBaseViewModelProtocol>

+ (instancetype _Nullable )viewModelWithModule:(UIViewController*_Nullable)moduleController moduleDataSource: (id<JKModuleDelegate> _Nullable)moduleDataSource;

@property (weak, nonatomic, readonly) UIViewController* _Nullable moduleController;

@property (weak, nonatomic, readonly) id<JKModuleDelegate> _Nullable moduleDataSource;

@property (copy, nonatomic, readonly) NSString * _Nullable viewModelID;

@property (strong, nonatomic) id _Nullable data;

@property (copy, nonatomic, readonly) NSString * _Nullable cellID;

@property (strong, nonatomic) NSIndexPath * _Nullable indexPath;

// Override to subView
- (NSBundle*_Nullable)defaultBundle;

// Override to subView
- (void)registerCell;

// Override to subView
- (void)registerCellWithBundle: (NSBundle*_Nullable)bundle;

- (void)reloadData;

- (void)reloadSections:(NSIndexSet *_Nullable)sections withRowAnimation:(UITableViewRowAnimation)animation;

- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath*> *_Nullable)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

@end
