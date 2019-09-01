//
//  TableViewCell1.m
//  JKViewModel
//
//  Created by 姜奎 on 2019/8/31.
//  Copyright © 2019 Loan. All rights reserved.
//

#import "TableViewCell1.h"

@implementation TableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(Home1Model*)model{
    _model = model;
    self.textLabel.text = [NSString stringWithFormat:@"%@|%@",model.title,model.title];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
