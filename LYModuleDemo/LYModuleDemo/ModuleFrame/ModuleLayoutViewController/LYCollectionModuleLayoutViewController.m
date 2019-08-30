//
//  LYCollectionModuleLayoutViewController.m
//  LYModuleDemo
//
//  Created by yanliu on 2019/8/27.
//  Copyright © 2019 ly. All rights reserved.
//

#import "LYCollectionModuleLayoutViewController.h"
#import "LYCollectionModuleAppearance.h"

@interface LYCollectionModuleLayoutViewController ()

@end

@implementation LYCollectionModuleLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Refresh

- (void)deepRefreshWithModuleControllerArray:(NSArray *)moduleControllerArray
{
    NSArray *moduleAppearanceArray = [self moduleAppearanceArrayForModuleControllerArray:moduleControllerArray];
    
    [self refreshWithModuleAppearanceArray:moduleAppearanceArray completion:^(BOOL finished) {
        // 全部模块deepRefresh
        for (id<LYCollectionModuleAppearance> moduleAppearance in moduleAppearanceArray) {
            if ([moduleAppearance respondsToSelector:@selector(deepRefreshModule)]) {
                [moduleAppearance deepRefreshModule];
            }
        }
    }];
}

- (NSArray *)moduleAppearanceArrayForModuleControllerArray:(NSArray *)moduleControllerArray
{
    NSMutableArray *moduleAppearanceArray = [NSMutableArray array];
    
    for (LYModuleController *moduleController in moduleControllerArray) {
        if (moduleController.moduleAppearance) {
            // 避免添加Equal的moduleAppearance造成crash
            if (![moduleAppearanceArray containsObject:moduleController.moduleAppearance]) {
                [moduleAppearanceArray addObject:moduleController.moduleAppearance];
            }
        } else {
            id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleControllerFactory collectionModuleAppearanceForModuleController:moduleController];
            
            if (moduleAppearance) {
                moduleAppearance.moduleController = moduleController;
                moduleAppearance.collectionModuleLayoutViewController = self;
                
                moduleController.moduleAppearance = moduleAppearance;

                // 避免添加Equal的moduleAppearance造成crash
                if (![moduleAppearanceArray containsObject:moduleAppearance]) {
                    [moduleAppearanceArray addObject:moduleAppearance];
                    
                    //注册
                    [moduleAppearance registerViewForModule];
                }
            }
        }
    }
    
    return [NSArray arrayWithArray:moduleAppearanceArray];
}

- (void)refreshWithModuleAppearanceArray:(NSArray *)moduleAppearanceArray completion:(void(^)(BOOL finished))completion
{
    self.moduleAppearanceArray = [NSArray arrayWithArray:moduleAppearanceArray];
    [self.collectionView reloadData];
    [self.collectionView layoutIfNeeded];
    if (completion) {
        completion(YES);
    }
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger number = 0;
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:section];
    if ([moduleAppearance respondsToSelector:@selector(numberOfItemsInModule)]) {
        number = [moduleAppearance numberOfItemsInModule];
    }
    return number;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.moduleAppearanceArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:[indexPath section]];
    if ([moduleAppearance respondsToSelector:@selector(cellForItemAtIndex:)]) {
        cell = [moduleAppearance cellForItemAtIndex:[indexPath item]];
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = nil;
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:[indexPath section]];
    if ([moduleAppearance respondsToSelector:@selector(viewForSupplementaryElementOfKind:atIndex:)]) {
        view = [moduleAppearance viewForSupplementaryElementOfKind:kind atIndex:[indexPath item]];
    }
    return view;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeZero;
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:[indexPath section]];
    if ([moduleAppearance respondsToSelector:@selector(sizeForItemAtIndex:)]) {
        size = [moduleAppearance sizeForItemAtIndex:[indexPath item]];
    }
    return size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat space = 0.f;
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:section];
    if ([moduleAppearance respondsToSelector:@selector(minimumLineSpacingForModule)]) {
        space = [moduleAppearance minimumLineSpacingForModule];
    }
    return space;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat space = 0.f;
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:section];
    if ([moduleAppearance respondsToSelector:@selector(minimumInteritemSpacingForModule)]) {
        space = [moduleAppearance minimumInteritemSpacingForModule];
    }
    return space;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets inset = UIEdgeInsetsZero;
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:section];
    if ([moduleAppearance respondsToSelector:@selector(insetForModule)]) {
        inset = [moduleAppearance insetForModule];
    }
    return inset;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize size = CGSizeZero;
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:section];
    if ([moduleAppearance respondsToSelector:@selector(referenceSizeForFooterInModule)]) {
        size = [moduleAppearance referenceSizeForFooterInModule];
    }
    return size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = CGSizeZero;
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:section];
    if ([moduleAppearance respondsToSelector:@selector(referenceSizeForHeaderInModule)]) {
        size = [moduleAppearance referenceSizeForHeaderInModule];
    }
    return size;
}

#pragma mark - UICollectonViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:[indexPath section]];
    LYModuleController *moduleController = moduleAppearance.moduleController;
    id<LYModuleActionResponder> moduleActionResponder = moduleController.moduleActionResponder;
    
    if ([moduleActionResponder respondsToSelector:@selector(didSelectItemAtIndex:moduleAppearance:viewController:)]) {
        [moduleActionResponder didSelectItemAtIndex:[indexPath item]
                                   moduleAppearance:moduleAppearance
                                     viewController:self];
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:[indexPath section]];
    LYModuleController *moduleController = moduleAppearance.moduleController;
    id<LYModuleActionResponder> moduleActionResponder = moduleController.moduleActionResponder;
    
    if ([moduleActionResponder respondsToSelector:@selector(willDisplayCell:atIndex:moduleAppearance:viewController:)]) {
        [moduleActionResponder willDisplayCell:cell
                                       atIndex:[indexPath item]
                              moduleAppearance:moduleAppearance
                                viewController:self];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    id<LYCollectionModuleAppearance> moduleAppearance = [self.moduleAppearanceArray objectAtIndex:[indexPath section]];
    LYModuleController *moduleController = moduleAppearance.moduleController;
    id<LYModuleActionResponder> moduleActionResponder = moduleController.moduleActionResponder;
    
    if ([moduleActionResponder respondsToSelector:@selector(didEndDisplayCell:atIndex:moduleAppearance:viewController:)]) {
        [moduleActionResponder didEndDisplayCell:cell
                                         atIndex:[indexPath item]
                                moduleAppearance:moduleAppearance
                                  viewController:self];
    }
}

@end
