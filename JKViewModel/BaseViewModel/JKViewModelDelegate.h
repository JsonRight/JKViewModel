//
//  JKViewModelDelegate.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol JKViewModelDelegate <NSObject>

- (void)lbk_cellWillDisplayAtIndexPath: (NSIndexPath*)indexPath withAdapter: (LBKTableViewBaseAdapter*)adapter;

@end

