//
//  BLBalanceTabelHearderView.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLBalanceTabelHearderView.h"

@interface BLBalanceTabelHearderView ()
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *canTiXianLabel;
@property (weak, nonatomic) IBOutlet UILabel *waitSureLabel;
@end

@implementation BLBalanceTabelHearderView

+ (instancetype)loadViewFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib{
    self.backgroundColor = kBgColor;
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 234);
    self.autoresizingMask = UIViewAutoresizingNone;
}

@end
