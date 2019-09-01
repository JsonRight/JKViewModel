//
//  Home1ViewModel.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/31.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "Home1ViewModel.h"
#import "TableViewCell1.h"
@implementation Home1ViewModel
@synthesize data = _data;
- (NSString *)viewModelID {
    return NSStringFromClass(TableViewCell1.class);
}
- (Home1Model*)data {
    if (!_data) {
        _data = [Home1Model new];
    }
    return _data;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TableViewCell1* cell = [tableView dequeueReusableCellWithIdentifier:self.cellID];
    cell.model = self.data;
    return cell;
}

- (NSString * _Nullable)cellID {
    return NSStringFromClass(TableViewCell1.class);
}

@end
@implementation Home1Model

-(NSString *)title {
    if (!_title) {
        NSInteger a = arc4random_uniform (100);
        _title = [NSString stringWithFormat:@"%ld",a];
    }
    return _title;
}

@end
