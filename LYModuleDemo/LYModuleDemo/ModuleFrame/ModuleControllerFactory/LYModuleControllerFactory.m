//
//  LYModuleControllerFactory.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import "LYModuleControllerFactory.h"
#import "NSObject+ModuleDataListSource.h"

NSDictionary *moduleDataListSourceCache;

@implementation LYModuleControllerFactory

+ (instancetype)sharedModuleControllerFactory
{
    static LYModuleControllerFactory *factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[self alloc] init];
    });
    return factory;
}

#pragma mark - ModuleData

- (id<LYModuleData>)moduleDataWithInfo:(NSDictionary *)dict
{
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    id<LYModuleData> moduleData = nil;
    id<LYModuleDataListSource> dataListSource = [self moduleDataListSourceWithInfo:dict];
    if (dataListSource) {
        moduleData = [dataListSource parseModuleDataWithDictionary:dict];
        NSObject *data = moduleData;
        data.ly_moduleDataListSource = dataListSource;
    }
    return moduleData;
}

#pragma mark - ModuleDataListSource

- (id<LYModuleDataListSource>)moduleDataListSourceWithInfo:(NSDictionary *)dict
{
    id<LYModuleDataListSource> dataListSource = nil;
    
    NSString *tid = dict[@"tid"];
    NSString *moduleDataListSourceClassName = [self moduleDataListSourceClassNameFromTid:tid];
    if ([moduleDataListSourceClassName length] > 0) {
        dataListSource = [[NSClassFromString(moduleDataListSourceClassName) alloc] init];
    }
    
    return dataListSource;
}

- (NSString *)moduleDataListSourceClassNameFromTid:(NSString *)tid
{
    static NSDictionary *sourceNameDic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sourceNameDic = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ModuleDataListSourceClassName" ofType:@"plist"]];
    });
    
    return [sourceNameDic valueForKey:tid];
}

#pragma mark - ModuleActionResponder

- (id<LYModuleActionResponder>)moduleActionResponderForModuleController:(LYModuleController *)moduleController
{
    id<LYModuleActionResponder> moduleActionResponder = nil;

    NSString *tid = moduleController.tid;
    NSString *responderClassName = [self moduleActionResponderClassNameFromTid:tid];
    if ([responderClassName length] > 0) {
        moduleActionResponder = [[NSClassFromString(responderClassName) alloc] init];
    }
    
    return moduleActionResponder;
}

- (NSString *)moduleActionResponderClassNameFromTid:(NSString *)tid
{
    static NSDictionary *responderNameDic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        responderNameDic = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ModuleActionResponderClassName" ofType:@"plist"]];
    });

    return [responderNameDic valueForKey:tid];
}

#pragma mark - CollectionModuleAppearance

- (id<LYCollectionModuleAppearance>)collectionModuleAppearanceForModuleController:(LYModuleController *)moduleController
{
    id<LYCollectionModuleAppearance> moduleAppearance = nil;
    
    NSString *tid = moduleController.moduleData.tid;
    NSString *appearanceClassName = [self collectionModuleAppearanceClassNameFromTid:tid];
    if ([appearanceClassName length] > 0) {
        moduleAppearance = [[NSClassFromString(appearanceClassName) alloc] init];
    }
    
    return moduleAppearance;
}

- (NSString *)collectionModuleAppearanceClassNameFromTid:(NSString *)tid
{
    static NSDictionary *appearanceNameDic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appearanceNameDic = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CollectionModuleAppearanceClassName" ofType:@"plist"]];
    });
    return [appearanceNameDic valueForKey:tid];
}

#pragma mark - ModuleController

- (LYModuleController *)moduleControllerForModuleData:(id<LYModuleData>)module
{
    LYModuleController *moduleController = nil;
    if (!module) {
        return nil;
    }
    
    moduleController = [[LYModuleController alloc] init];
    moduleController.moduleData = module;
    
    // 配置moduleDataListSource
    NSObject *obj = module;
    if (obj.ly_moduleDataListSource) {
        moduleController.dataListSource = obj.ly_moduleDataListSource;
        obj.ly_moduleDataListSource = nil;
    }
    
    // moduleDataListSource默认的delegate为moduleController
    id<LYModuleDataListSource> dataListSource = moduleController.dataListSource;
    if (!dataListSource.delegate) {
        moduleController.dataListSource.delegate = (id<LYModuleDataListSource>)moduleController;
    }
    
    // 配置moduleActionResponder
    id<LYModuleActionResponder> moduleActionResponder = [self moduleActionResponderForModuleController:moduleController];
    moduleController.moduleActionResponder = moduleActionResponder;
    
    return moduleController;
}

- (NSArray<LYModuleController *> *)moduleControllerArrayForModuleDataArray:(NSArray<id<LYModuleData>> *)moduleDataArray withReusableModuleControllerArray:(NSArray<LYModuleController *> *)reusableModuleControllerArray
{
    NSMutableArray *moduleControllerArray = [NSMutableArray array];
    
    for (id<LYModuleData> moduleData in moduleDataArray) {
        BOOL hasReusableController = NO;
        for (LYModuleController *moduleController in reusableModuleControllerArray) {
            if ([moduleController.moduleData isEqual:moduleData] &&
                [moduleControllerArray indexOfObject:moduleController] == NSNotFound) {
                // 重用的时候，不是同一个对象需要根据新数据更新旧数据
                if (moduleController.moduleData != moduleData) {
                    if ([moduleController.dataListSource respondsToSelector:@selector(updateModuleData:withModuleData:)]) {
                        [moduleController.dataListSource updateModuleData:moduleController.moduleData
                                                           withModuleData:moduleData];
                    }
                }
                
                [moduleControllerArray addObject:moduleController];
                hasReusableController = YES;
                break;
            }
        }
        
        if (!hasReusableController) {
            LYModuleController *moduleController = [self moduleControllerForModuleData:moduleData];
            [moduleControllerArray addObject:moduleController];
        }
    }
    
    return [NSArray arrayWithArray:moduleControllerArray];
}
@end

