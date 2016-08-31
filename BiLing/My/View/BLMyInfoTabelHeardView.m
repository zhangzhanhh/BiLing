//
//  BLMyInfoTabelHeardView.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLMyInfoTabelHeardView.h"

@interface BLMyInfoTabelHeardView ()
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@end

@implementation BLMyInfoTabelHeardView

+ (instancetype)loadViewFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib{
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 233);
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (IBAction)iconBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(myInfoTabelHeardView:didClickBtnWithType:)]) {
        [self.delegate myInfoTabelHeardView:self didClickBtnWithType:BLMyInfoTabelHeardViewIconBtnClick];
    }
}
- (IBAction)uploadImageBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(myInfoTabelHeardView:didClickBtnWithType:)]) {
        [self.delegate myInfoTabelHeardView:self didClickBtnWithType:BLMyInfoTabelHeardViewUploadImageBtnClick];
    }
}

@end
