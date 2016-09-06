//
//  BLMyCollectTableViewCell.m
//  BiLing
//
//  Created by 章展赫 on 16/8/31.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLMyCollectTableViewCell.h"

@interface BLMyCollectTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sexImageView;
@end

@implementation BLMyCollectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(BLMyCollectModel *)model{
    _model = model;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.iconImageUrl] placeholderImage:[UIImage imageNamed:@"椭圆-1-拷贝-3"]];
    self.nameLabel.text = model.name;
    self.detailLabel.text = model.detail;
    [self.sexImageView sd_setImageWithURL:[NSURL URLWithString:model.sexImageUrl] placeholderImage:[UIImage imageNamed:@"椭圆-1-拷贝-3"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
