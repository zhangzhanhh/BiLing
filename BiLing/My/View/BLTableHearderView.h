//
//  BLTableHearderView.h
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BLTableHearderView;

typedef enum : NSUInteger {
    BLTableHearderViewUserIconBtnClick, //用户头像
    BLTableHearderViewLoginBtnClick,    //登陆按钮
    BLTableHearderViewConutBtnClick,    //余额
    BLTableHearderViewRedBagBtnClick,   //红包
    BLTableHearderViewOtherBtnClick,    //其他
} BLTableHearderViewBtnClickType;

@protocol BLTableHearderViewDelegate <NSObject>

@optional
- (void)tableHearderView:(BLTableHearderView *)tableHearderView didClickBtn:(UIButton *)btn withType:(BLTableHearderViewBtnClickType)type;

@end

@interface BLTableHearderView : UIView
@property (weak, nonatomic) id<BLTableHearderViewDelegate> delegate;
+ (instancetype)loadViewFromNib;
@end
