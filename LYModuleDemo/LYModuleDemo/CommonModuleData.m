//
//  CommonModuleData.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import "CommonModuleData.h"

@implementation CommonModuleData

- (BOOL)isEqual:(id)other
{
    if (![other isKindOfClass:[self class]]) {
        return NO;
    }
    
    CommonModuleData *otherModuleData = other;
    return [self.tid isEqualToString:otherModuleData.tid] && [self.dlist isEqualToArray:otherModuleData.dlist];
}

@end

