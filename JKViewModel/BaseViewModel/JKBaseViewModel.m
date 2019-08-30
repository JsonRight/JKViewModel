//
//  JKBaseViewModel.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "JKBaseViewModel.h"
@interface JKBaseViewModel()

@end

@implementation JKBaseViewModel

@synthesize viewModelID = _viewModelID;

@synthesize adapter = _adapter;

@synthesize data = _data;

- (void)setAdapter:(id<JKViewModelAdapterDelegate>)adapter{
    _adapter = adapter;
    [self registerCellWithReuseIdentifier];
}

- (void)registerCellWithReuseIdentifier{
    if (_adapter&&_viewModelID&&[_adapter respondsToSelector:@selector(registerCellWithReuseIdentifier:)]) {
        [_adapter registerCellWithReuseIdentifier:_viewModelID];
    }
}

- (NSInteger)numberOfSections{ return 1; }

- (NSInteger)numberOfItemsInSection:(NSInteger)section{ return 0; }

- (UIView *)viewForItemAtIndexPath:(NSIndexPath *)indexPath{ return nil; }

@end
