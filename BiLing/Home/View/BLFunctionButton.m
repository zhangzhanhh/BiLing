//
//  BLFunctionButton.m
//  BiLing
//
//  Created by 章展赫 on 16/8/29.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#define ImageRatio 0.45

#import "BLFunctionButton.h"

@implementation BLFunctionButton

- (void)awakeFromNib{
    self.adjustsImageWhenHighlighted = NO;
    self.titleLabel.font = FONT(13);
    self.backgroundColor = [UIColor whiteColor];
    [self setTitleColor:kDescColor forState:UIControlStateNormal];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height *ImageRatio;
    return CGRectMake(0, imageH *0.2, imageW, imageH );
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height*ImageRatio*1.2;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

@end
