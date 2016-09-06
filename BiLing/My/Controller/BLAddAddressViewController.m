//
//  BLAddAddressViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/31.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLAddAddressViewController.h"
#import "BLAddServiceAddressViewController.h"

@interface BLAddAddressViewController ()

@end

@implementation BLAddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加地址";
}
- (IBAction)locationBtnClick:(UIButton *)sender {
    [self.navigationController pushViewController:[[BLAddServiceAddressViewController alloc] init] animated:YES];
}
//保存
- (IBAction)saveBtnClick:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
