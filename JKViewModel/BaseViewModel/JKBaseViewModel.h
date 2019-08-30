//
//  JKBaseViewModel.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKViewModelDelegate.h"
#import "JKViewModelDataSource.h"

@interface JKBaseViewModel : NSObject<JKViewModelDataSource, JKViewModelDelegate>

@end
