//
//  CoverModuleDataListSource.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import "CoverModuleDataListSource.h"
#import "CommonModuleData.h"
#import "CoverInfo.h"

@implementation CoverModuleDataListSource

- (id<LYModuleData>)parseModuleDataWithDictionary:(NSDictionary *)dict
{
    NSString *tid = dict[@"tid"];
    if ([tid length] == 0) {
        return nil;
    }
    
    CommonModuleData *moduleData = [[CommonModuleData alloc] init];
    moduleData.tid = tid;
    moduleData.title = dict[@"data"][@"title"];
    
    NSArray *dlist = dict[@"data"][@"dlist"];
    NSMutableArray *coverInfoList = [NSMutableArray array];
    for (NSDictionary *infoDict in dlist) {
        CoverInfo *coverInfo = [[CoverInfo alloc] init];
        coverInfo.title = infoDict[@"title"];
        coverInfo.subtitle = infoDict[@"subtitle"];
        coverInfo.image = infoDict[@"img"];
        [coverInfoList addObject:coverInfo];
    }
    moduleData.dlist = [coverInfoList copy];
    
    return moduleData;
}

@end
