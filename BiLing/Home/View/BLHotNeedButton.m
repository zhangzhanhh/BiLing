//
//  BLHotNeedButton.m
//  BiLing
//
//  Created by 章展赫 on 16/8/29.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLHotNeedButton.h"

@implementation BLHotNeedButton

- (void)awakeFromNib{
    self.adjustsImageWhenHighlighted = NO;
    self.titleLabel.font = FONT(13);
    self.backgroundColor = [UIColor whiteColor];
    [self setTitleColor:kDescColor forState:UIControlStateNormal];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(self.width/5, 27, self.width/3*2, 20)];
    lable.textColor = [UIColor lightGrayColor];
    lable.text = @"解决你的\"热\"烦恼";
    lable.font = FONT(12);
    [self addSubview:lable];
    self.subLabel = lable;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(5, 5, self.width/4, self.height - 5 *2);
    self.titleLabel.frame = CGRectMake(self.imageView.right + 5,self.imageView.top,self.width-self.imageView.width-5,20);
    self.subLabel.frame = CGRectMake(self.titleLabel.left, self.titleLabel.bottom + 2, self.titleLabel.width, self.titleLabel.height);
}

@end
