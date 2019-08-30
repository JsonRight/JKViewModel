//
//  CommonModulePageDataSource.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/28.
//  Copyright © 2019 ly. All rights reserved.
//

#import "CommonModulePageDataSource.h"

@interface CommonModulePageDataSource()
@property (nonatomic, strong) void (^successBlock)(id<LYModulePageDataSource> dataSource);
@property (nonatomic, strong) void (^failedBlock)(id<LYModulePageDataSource> dataSource, NSError *error);
@end

@implementation CommonModulePageDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moduleDataList = [NSMutableArray array];
    }
    return self;
}

- (void)requestModulePageDataWithSuccessBlock:(void (^)(id<LYModulePageDataSource> dataSource))successBlock
                                  failedBlock:(void (^)(id<LYModulePageDataSource> dataSource, NSError *error))failedBlock
{
    self.successBlock = successBlock;
    self.failedBlock = failedBlock;
    
    NSString *urlStr = @"http://ly.demo.com";
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        typeof(weakSelf) strongSelf = weakSelf;
        
        if (error || ((NSHTTPURLResponse *)response).statusCode != 200) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (strongSelf.failedBlock) {
                    strongSelf.failedBlock(strongSelf, error);
                    strongSelf.failedBlock = nil;
                }
            });
            return;
        }
        
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [strongSelf parseContent:content];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.successBlock) {
                self.successBlock(self);
                self.successBlock = nil;
                self.failedBlock = nil;
            }
        });
    }];
    [dataTask resume];
}

- (void)parseContent:(NSString *)content
{
    NSError *error = nil;
    id JSONObject = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding]
                                                    options:0
                                                      error:&error];
    
    if (![JSONObject isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    NSArray *moduleArray = JSONObject[@"modules"];
    if ([moduleArray isKindOfClass:[NSArray class]]) {
        for (NSDictionary *moduleDict in moduleArray) {
            if ([moduleDict isKindOfClass:[NSDictionary class]]) {
                // 调用moduleControllerFactory生成ModuleData
                id<LYModuleData> moduleData = [self.moduleControllerFactory moduleDataWithInfo:moduleDict];
                if (moduleData) {
                    [self.moduleDataList addObject:moduleData];
                }
            }
        }
    }
}

- (void)cleanData
{
    [self.moduleDataList removeAllObjects];
}

@end
