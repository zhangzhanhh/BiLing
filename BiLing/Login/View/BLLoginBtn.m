//
//  BLLoginBtn.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLLoginBtn.h"

@implementation BLLoginBtn
- (void)awakeFromNib{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    self.titleLabel.font = FONT(13);
}
@end
