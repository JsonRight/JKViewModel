//
//  JKModuleDelegate.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/9/1.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JKModuleDelegate <NSObject>

- (void)reloadData;

- (void)reloadSections:(NSIndexSet *_Nullable)sections withRowAnimation:(UITableViewRowAnimation)animation;

- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath*> *_Nullable)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

- (void)registerCellWithforCellReuseIdentifier:(NSString*_Nullable)identifier inBundle:(NSBundle*_Nullable)bundle;


@end
