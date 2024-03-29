//
//  UIBarButtonItem+MJ.h
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MJ)
/**
 *  快速创建一个显示图片的item
 *
 *  @param action   监听方法
 */
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
//使用该方法可以自定义item的大小
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon frame:(CGRect)frame target:(id)target action:(SEL)action;

+(UIBarButtonItem *)backItemWithFrmae:(CGRect)frame icon:(NSString *)icon title:(NSString *)title target:(id)target action:(SEL)action;

@end
