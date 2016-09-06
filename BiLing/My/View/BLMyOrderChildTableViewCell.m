//
//  BLMyOrderChildTableViewCell.m
//  BiLing
//
//  Created by 章展赫 on 16/8/31.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLMyOrderChildTableViewCell.h"

@interface BLMyOrderChildTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *footView;
@property (weak, nonatomic) IBOutlet UIView *fengexian;
@end

@implementation BLMyOrderChildTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.footView.backgroundColor = kBgColor;
    self.fengexian.backgroundColor = kBgColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
