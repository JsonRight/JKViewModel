//
//  JKViewModelDelegate.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JKViewModelDelegate <NSObject>

// Override to subView
- (NSBundle*)defaultBundle;
@optional
- (void)lbk_cellWillDisplayAtIndexPath: (NSIndexPath*)indexPath;

@end

