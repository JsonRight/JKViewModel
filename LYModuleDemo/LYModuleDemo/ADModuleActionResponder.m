//
//  ADModuleActionResponder.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/30.
//  Copyright © 2019 ly. All rights reserved.
//

#import "ADModuleActionResponder.h"
#import "LYModuleAppearance.h"
#import "LYModuleController.h"
#import "LYModuleData.h"
#import "CoverInfo.h"

@implementation ADModuleActionResponder

- (void)didSelectItemAtIndex:(NSInteger)index moduleAppearance:(id<LYModuleAppearance>)moduleAppearance viewController:(UIViewController *)viewController
{
    id ModuleInfo = [moduleAppearance.moduleController.moduleData.dlist objectAtIndex:index];
    if ([ModuleInfo isKindOfClass:[CoverInfo class]]) {
        NSString *jumpLink = ((CoverInfo *)ModuleInfo).jumpLink;
        if ([jumpLink length] > 0) {
            NSURL *url = [NSURL URLWithString:jumpLink];
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    
}

@end
