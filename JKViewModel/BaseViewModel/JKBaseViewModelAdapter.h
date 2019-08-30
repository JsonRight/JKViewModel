//
//  JKBaseViewModelAdapter.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKViewModelAdapterDelegate.h"

@interface JKBaseViewModelAdapter : NSObject<JKViewModelAdapterDelegate, UITableViewDelegate, UITableViewDataSource>

@end

extern JKBaseViewModelAdapter * AdapterForTableViewMake(__weak UIViewController * moduleController,__weak UITableView *tableView);

extern JKBaseViewModelAdapter * AdapterForCollectionMake(__weak UIViewController * moduleController,__weak UICollectionView *collectionView);
