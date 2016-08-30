//
//  UIImage+XMGExtension.h
//  01-百思不得姐
//
//  Created by xiaomage on 15/8/3.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XMGExtension)
/**
 * 圆形图片
 */
- (UIImage *)circleImage;
/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;

+ (UIImage *)composeHeaderImageWithConstrainWH:(CGFloat)headerWH imagePathArray:(NSArray *)imagePathArray backgroundColor:(UIColor *)backgroundColor;


@end
