//
//  RuTextField.h
//  ruru
//
//  Created by 章展赫 on 15/8/25.
//  Copyright (c) 2015年 wentian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTextField : UITextField

- (id)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder;

-(id)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder borderWidth:(CGFloat)borderWidth borderColor:(CGColorRef)borderColor;
@end
