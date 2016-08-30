//
//  UISearchBar+HH.m
//  黑马微博
//
//  Created by 章展赫 on 15/5/27.
//  Copyright (c) 2015年 MrZ. All rights reserved.
//

#import "UISearchBar+HH.h"
#import "UIImage+XMGExtension.h"
@implementation UISearchBar (HH)
+ (UITextField *)searchBarWithBackgroundImageName:(NSString *)bgImageName iconImageName:(NSString *)iconImageName
{
    UITextField* textField = [[UITextField alloc]init];
    textField.width = 300;
    textField.height = 35;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [textField setBackground:[UIImage resizedImage:bgImageName]];
    //textField setBackground:[UIImage imageNamed:]
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:iconImageName]];
    imageView.height = 15;
    imageView.width = 30;
    imageView.contentMode = UIViewContentModeCenter;
    [textField setLeftView:imageView];
    [textField setLeftViewMode:UITextFieldViewModeAlways];
    textField.clearButtonMode = UITextFieldViewModeAlways;
    return textField;
}
@end
