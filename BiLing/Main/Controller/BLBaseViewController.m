//
//  BLBaseViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLBaseViewController.h"
#import "UIBarButtonItem+MJ.h"
@interface BLBaseViewController ()

@end

@implementation BLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self == self.navigationController.viewControllers.firstObject) {
        return;
    }
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"" highIcon:@"" target:self action:@selector(backVC)];
}

- (void)backVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
