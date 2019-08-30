//
//  JKBaseViewModel.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/30.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "JKBaseViewModel.h"
@interface JKBaseViewModel()
@property (weak, nonatomic, readwrite) UIViewController * moduleController;
@property (weak, nonatomic, readwrite) UIView * contentView;
@end

@implementation JKBaseViewModel

@synthesize viewModelID = _viewModelID;
@synthesize moduleController = _moduleController;
@synthesize contentView = _contentView;
@synthesize data = _data;

- (NSBundle *)defaultBundle { return [NSBundle mainBundle]; }

- (void)registerCellWithReuseIdentifier{
    [self registerCell];
}

- (void)registerCell{
    [self registerCellWithBundle:[self defaultBundle]];
}
- (void)registerCellWithBundle: (NSBundle*)bundle{
    NSURL* urlOfNib = [bundle URLForResource:self.viewModelID withExtension:@"nib"];
    if ([self.contentView isKindOfClass:UITableView.class]) {
        UITableView * tableView = (UITableView *)self.contentView;
        if (urlOfNib) {
            UINib* nib = [UINib nibWithNibName:self.viewModelID bundle:bundle];
            [tableView registerNib: nib
                 forCellReuseIdentifier: self.viewModelID];
        } else {
            id cellClass = NSClassFromString(self.viewModelID);
            if (cellClass) {
                [tableView registerClass:cellClass forCellReuseIdentifier:self.viewModelID];
            }
        }
    }else if ([self.contentView isKindOfClass:UICollectionView.class]) {
        UICollectionView * collectionView = (UICollectionView *)self.contentView;
        if (urlOfNib) {
            UINib* nib = [UINib nibWithNibName:self.viewModelID bundle:bundle];
            [collectionView registerNib:nib forCellWithReuseIdentifier:self.viewModelID];
        } else {
            id cellClass = NSClassFromString(self.viewModelID);
            if (cellClass) {
                [collectionView registerClass:cellClass forCellWithReuseIdentifier:self.viewModelID];
            }
        }
    }else{
        /////
    }
}
- (NSInteger)numberOfSections{ return 1; }

- (NSInteger)numberOfItemsInSection:(NSInteger)section{ return 0; }

- (UIView *)viewForItemAtIndexPath:(NSIndexPath *)indexPath{ return nil; }


@end
