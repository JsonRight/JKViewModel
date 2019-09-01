//
//  HomeViewModel.h
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/31.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "JKBaseViewModel.h"
@class HomeModel;
@interface HomeViewModel : JKBaseViewModel
@property (nonatomic, assign) BOOL isOpen;
@end

@interface HomeModel : NSObject
@property (nonatomic, copy) NSString *title;
@end
