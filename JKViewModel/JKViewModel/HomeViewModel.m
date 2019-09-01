//
//  HomeViewModel.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/31.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "HomeViewModel.h"
#import "TableViewCell.h"
@implementation HomeViewModel
@synthesize data = _data;
- (NSString *)viewModelID {
    return NSStringFromClass(self.class);
}
- (HomeModel*)data {
    if (!_data) {
        _data = [HomeModel new];
    }
    return _data;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:self.cellID];
    cell.model = self.data;
    __weak typeof(self) _self = self;
    cell.block = ^{
        __strong typeof(_self) self = _self;
        NSInteger a = arc4random_uniform (100);
        ((HomeModel*)self.data).title = [NSString stringWithFormat:@"%ld",a];
//        [self reloadRowsAtIndexPaths:@[self.indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
        [self reloadData];

    };
    return cell;
}

- (NSString * _Nullable)cellID {
    return NSStringFromClass(TableViewCell.class);
}

@end
@implementation HomeModel

-(NSString *)title {
    if (!_title) {
        NSInteger a = arc4random_uniform (100);
        _title = [NSString stringWithFormat:@"%ld",a];
    }
    return _title;
}

@end
