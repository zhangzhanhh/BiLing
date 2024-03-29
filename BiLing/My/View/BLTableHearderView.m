//
//  BLTableHearderView.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLTableHearderView.h"
#import "BLOrderButton.h"

@interface BLTableHearderView ()

@end

@implementation BLTableHearderView

+ (instancetype)loadViewFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib{
    self.backgroundColor = kBgColor;
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 261);
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (IBAction)userIconBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(tableHearderView:didClickBtn:withType:)]) {
        [self.delegate tableHearderView:self didClickBtn:sender withType:BLTableHearderViewUserIconBtnClick];
    }
}
- (IBAction)loginBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(tableHearderView:didClickBtn:withType:)]) {
        [self.delegate tableHearderView:self didClickBtn:sender withType:BLTableHearderViewLoginBtnClick];
    }
}
- (IBAction)conutBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(tableHearderView:didClickBtn:withType:)]) {
        [self.delegate tableHearderView:self didClickBtn:sender withType:BLTableHearderViewConutBtnClick];
    }
}
- (IBAction)redBagBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(tableHearderView:didClickBtn:withType:)]) {
        [self.delegate tableHearderView:self didClickBtn:sender withType:BLTableHearderViewRedBagBtnClick];
    }
}
- (IBAction)orderBtnClick:(BLOrderButton *)sender {
    if ([self.delegate respondsToSelector:@selector(tableHearderView:didClickBtn:withType:)]) {
        [self.delegate tableHearderView:self didClickBtn:sender withType:BLTableHearderViewOtherBtnClick];
    }
}

@end
