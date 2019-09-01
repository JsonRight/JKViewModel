//
//  Home1ViewModel.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/31.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "JKBaseViewModel.h"
@class Home1Model;
@interface Home1ViewModel : JKBaseViewModel

@end

@interface Home1Model : NSObject
@property (nonatomic, copy) NSString *title;
@end
