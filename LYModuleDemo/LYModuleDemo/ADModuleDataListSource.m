//
//  ADModuleDataListSource.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/29.
//  Copyright © 2019 ly. All rights reserved.
//

#import "ADModuleDataListSource.h"
#import "CommonModuleData.h"
#import "CoverInfo.h"

@implementation ADModuleDataListSource

- (id<LYModuleData>)parseModuleDataWithDictionary:(NSDictionary *)dict
{
    NSString *tid = dict[@"tid"];
    if ([tid length] == 0) {
        return nil;
    }
    
    CommonModuleData *moduleData = [[CommonModuleData alloc] init];
    moduleData.tid = tid;
    return moduleData;
}

- (void)requestModuleDataListForModule:(id<LYModuleData>)moduleData
{
    NSString *urlStr = @"http://ly.demo.com/ad";
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        typeof(weakSelf) strongSelf = weakSelf;
        
        if (error || ((NSHTTPURLResponse *)response).statusCode != 200) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([strongSelf.delegate respondsToSelector:@selector(loadingModuleDataListFailed:failedInfo:)]) {
                    [strongSelf.delegate loadingModuleDataListFailed:strongSelf failedInfo:error];
                }
            });
            return;
        }
        
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSArray *adList = [strongSelf parseContent:content];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([strongSelf.delegate respondsToSelector:@selector(loadingModuleDataListSucceed:dataList:)]) {
                [strongSelf.delegate loadingModuleDataListSucceed:strongSelf dataList:adList];
            }
        });
        
    }];
    [dataTask resume];
}

- (NSArray *)parseContent:(NSString *)content
{
    NSError *error = nil;
    id JSONObject = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding]
                                                    options:0
                                                      error:&error];
    
    if (![JSONObject isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray *adInfoArray = [NSMutableArray array];
    for (NSDictionary *dict in JSONObject) {
        CoverInfo *adInfo = [[CoverInfo alloc] init];
        adInfo.title = dict[@"title"];
        adInfo.image = dict[@"img"];
        adInfo.jumpLink = dict[@"link"];
        [adInfoArray addObject:adInfo];
    }
    
    return [adInfoArray copy];
}

@end
