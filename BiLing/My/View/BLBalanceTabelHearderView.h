//
//  BLBalanceTabelHearderView.h
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BLBalanceTabelHearderViewDelegate <NSObject>

@optional

@end

@interface BLBalanceTabelHearderView : UIView
@property (weak, nonatomic) id<BLBalanceTabelHearderViewDelegate> delegate;
+ (instancetype)loadViewFromNib;
@end
