//
//  BLFindViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/29.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLFindViewController.h"


@interface BLFindViewController ()



@end

@implementation BLFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)BtnAllTypeClicked:(UIButton *)sender {
    if([self.BtnAllType.titleLabel.text isEqualToString:@"全部类目  ∨"])
    {
        [self.BtnAllType setTitle:@"全部类目  ^" forState:UIControlStateNormal];
    }else{
        [self.BtnAllType setTitle:@"全部类目  ∨" forState:UIControlStateNormal];
    }

}

- (IBAction)BtnDefaultFilterClicked:(UIButton *)sender {


}


@end
