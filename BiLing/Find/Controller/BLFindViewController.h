//
//  BLFindViewController.h
//  BiLing
//
//  Created by 章展赫 on 16/8/29.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLFindViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *BtnAllType;

@property (strong, nonatomic) IBOutlet UIButton *BtnDefaultFilter;


- (IBAction)BtnAllTypeClicked:(UIButton *)sender;


- (IBAction)BtnDefaultFilterClicked:(UIButton *)sender;


@end
