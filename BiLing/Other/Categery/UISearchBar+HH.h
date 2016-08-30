//
//  UISearchBar+HH.h
//  黑马微博
//
//  Created by 章展赫 on 15/5/27.
//  Copyright (c) 2015年 MrZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (HH)
/**
 *  创建一个自定义搜索框
 *
 *  @param bgImageName   搜索框背景图片
 *  @param iconImageName 搜索框图标
 *
 *  @return 搜索框
 */
+ (UITextField *)searchBarWithBackgroundImageName:(NSString *)bgImageName iconImageName:(NSString *)iconImageName;
@end
