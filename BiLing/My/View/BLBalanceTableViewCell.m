//
//  BLBalanceTableViewCell.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLBalanceTableViewCell.h"

@interface BLBalanceTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation BLBalanceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImage.contentMode = UIViewContentModeScaleAspectFit;
    self.title.font = FONT(13);
    self.title.tintColor = kDescColor;
}

- (void)setModel:(BLBanlanceCellModel *)model{
    _model = model;
    self.iconImage.image = [UIImage imageNamed:model.imageName];
    self.title.text = model.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
