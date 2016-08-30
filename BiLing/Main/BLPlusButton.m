//
//  BLPlusButton.m
//  BiLing
//
//  Created by 章展赫 on 16/8/29.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLPlusButton.h"
#import "BLPlusViewController.h"
#import "CYLTabBarController.h"
#import "AppDelegate.h"
#import "CYLTabBarControllerConfig.h"

@implementation BLPlusButton

+ (void)load {
    [super registerPlusButton];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

//上下结构的 button
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 控件大小,间距大小
    // 注意：一定要根据项目中的图片去调整下面的0.7和0.9，Demo之所以这么设置，因为demo中的 plusButton 的 icon 不是正方形。
    CGFloat const imageViewEdgeWidth   = self.bounds.size.width * 0.7;
    CGFloat const imageViewEdgeHeight  = imageViewEdgeWidth * 0.9;
    
    CGFloat const centerOfView    = self.bounds.size.width * 0.5;
    CGFloat const labelLineHeight = self.titleLabel.font.lineHeight;
    CGFloat const verticalMarginT = self.bounds.size.height - labelLineHeight - imageViewEdgeWidth;
    CGFloat const verticalMargin  = verticalMarginT / 2;
    
    // imageView 和 titleLabel 中心的 Y 值
    CGFloat const centerOfImageView  = verticalMargin + imageViewEdgeWidth * 0.5;
    CGFloat const centerOfTitleLabel = imageViewEdgeWidth  + verticalMargin * 2 + labelLineHeight * 0.5 + 5;
    
    //imageView position 位置
    self.imageView.bounds = CGRectMake(0, 0, imageViewEdgeWidth, imageViewEdgeHeight);
    self.imageView.center = CGPointMake(centerOfView, centerOfImageView);
    
    //title position 位置
    self.titleLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, labelLineHeight);
    self.titleLabel.center = CGPointMake(centerOfView, centerOfTitleLabel);
}

+ (id)plusButton{
    BLPlusButton *button = [[BLPlusButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - Event Response

- (void)clickPublish {
    BLPlusViewController *PVC = [[BLPlusViewController alloc] init];
   [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:PVC animated:YES completion:^{
       
   }];
}

+ (NSUInteger)indexOfPlusButtonInTabBar{
    return 2;
}
+ (CGFloat)multiplierOfTabBarHeight:(CGFloat)tabBarHeight{
    return 0.3f;
}


//+ (CGFloat)constantOfPlusButtonCenterYOffsetForTabBarHeight:(CGFloat)tabBarHeight {
//    return  -10;
//}

@end
