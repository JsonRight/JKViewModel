//
//  NSObject+ModuleDataListSource.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import "NSObject+ModuleDataListSource.h"
#import <objc/runtime.h>

@implementation NSObject (ModuleDataListSource)

- (void)setLy_moduleDataListSource:(id<LYModuleDataListSource>)ly_moduleDataListSource
{
    objc_setAssociatedObject(self, @selector(ly_moduleDataListSource), ly_moduleDataListSource, OBJC_ASSOCIATION_RETAIN);
}

- (id<LYModuleDataListSource>)ly_moduleDataListSource
{
    return objc_getAssociatedObject(self, @selector(ly_moduleDataListSource));
}

@end
