//
//  BLMyInfoTabelHeardView.h
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLMyInfoTabelHeardView;

typedef enum : NSUInteger {
    BLMyInfoTabelHeardViewIconBtnClick,
    BLMyInfoTabelHeardViewUploadImageBtnClick,
} BLMyInfoTabelHeardViewClickBtnType;

@protocol BLMyInfoTabelHeardViewDelegate <NSObject>

@optional
- (void)myInfoTabelHeardView:(BLMyInfoTabelHeardView *)tabelHeardView didClickBtnWithType:(BLMyInfoTabelHeardViewClickBtnType)type;

@end

@interface BLMyInfoTabelHeardView : UIView
@property (weak, nonatomic) id<BLMyInfoTabelHeardViewDelegate> delegate;
+ (instancetype)loadViewFromNib;
@end
