//
//  TableViewCell.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/31.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewModel.h"

typedef void(^BLock)(void);

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) HomeModel* model;
@property (nonatomic, copy) BLock block;

@end
