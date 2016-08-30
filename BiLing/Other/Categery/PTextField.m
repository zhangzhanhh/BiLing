//
//  RuTextField.m
//  ruru
//
//  Created by 章展赫 on 15/8/25.
//  Copyright (c) 2015年 wentian. All rights reserved.
//

#import "PTextField.h"
#define kMainTextColor BLColor(40,40,40)
@implementation PTextField

- (id)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder ;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:13];
        self.borderStyle = UITextBorderStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        self.placeholder = placeholder;
        self.textColor = kMainTextColor;
        }
    return self;
}

-(id)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder borderWidth:(CGFloat)borderWidth borderColor:(CGColorRef)borderColor;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:13];
        self.borderStyle = UITextBorderStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        self.placeholder = placeholder;
        self.textColor = kMainTextColor;
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor;
        self.layer.cornerRadius = 5.0f;
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds , 10 , 0 );
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds , 10 , 0 );
}

@end
