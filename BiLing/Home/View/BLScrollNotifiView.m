//
//  BLScrollNotifiView.m
//  BiLing
//
//  Created by 章展赫 on 16/8/29.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLScrollNotifiView.h"
#import "BBCyclingLabel.h"

@interface BLScrollNotifiView ()
@property (weak, nonatomic) IBOutlet BBCyclingLabel *scrollNotifiLabel;
@end

@implementation BLScrollNotifiView
- (void)awakeFromNib{
    self.scrollNotifiLabel.text = @"接单后取消订单会影响您的信用评分哦\n更多服务正在开通中,敬请期待";
    self.scrollNotifiLabel.font = FONT(12);
    self.scrollNotifiLabel.transitionEffect = BBCyclingLabelTransitionEffectScrollUp;
    [self startAnimation];
    self.clipsToBounds = YES;
}
- (void)startAnimation{
    [self.scrollNotifiLabel setText:@"接单后取消订单会影响您的信用评分哦" animated:YES];
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:2.0];
}
@end
