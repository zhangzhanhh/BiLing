//
//  BLMyAddressManagerViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/31.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLMyAddressManagerViewController.h"
#import "UIBarButtonItem+MJ.h"
#import "BLAddAddressViewController.h"

@interface BLMyAddressManagerViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property (weak, nonatomic) IBOutlet UIButton *addAddressBtn;
@end

@implementation BLMyAddressManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的地址";
    [self setUpView];
    [self setUpNavbar];
}

- (void)setUpView{
    self.view.backgroundColor = kBgColor;
    self.tabelView.tableFooterView = [UIView new];
}

- (void)setUpNavbar{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor grayColor];
}

- (IBAction)addAddressBtnClick:(UIButton *)sender {
    BLLog(@"添加地址");
    [self.navigationController pushViewController:[[BLAddAddressViewController alloc] init] animated:YES];
}

- (void)edit{
    BLLog(@"编辑");
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
