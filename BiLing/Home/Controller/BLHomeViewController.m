//
//  BLHomeViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/29.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLHomeViewController.h"
#import "UIBarButtonItem+MJ.h"
#import "BLFunctionButton.h"
#import "BLHotNeedButton.h"
#import "UISearchBar+HH.h"

@interface BLHomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

@implementation BLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1. 初始导航栏
    [self setUpNavbar];
    //2. 设置view背景色
    self.contentView.backgroundColor = kBgColor;
    self.scrollView.backgroundColor = kBgColor;
}

- (void)setUpNavbar{
    self.navigationController.navigationBar.barTintColor = BLColor(252, 221, 66);
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithFrmae:CGRectMake(0, 0, 60, 20) icon:@"" title:@"武汉市" target:self action:@selector(locationBtnClick:)];
    UITextField *searchBar = [UISearchBar searchBarWithBackgroundImageName:@"searchbar_textfield_background" iconImageName:@"searchbar_textfield_search_icon"];
    searchBar.placeholder = @"搜索服务、服务者";
    searchBar.font = FONT(12);
    self.navigationItem.titleView = searchBar;
}


- (IBAction)functionBtnClick:(BLFunctionButton *)sender {
    BLLog(@"%@",sender.titleLabel.text);
}


- (IBAction)hotNeedBtnClick:(BLHotNeedButton *)sender {
    BLLog(@"%@",sender.titleLabel.text);
}

- (void)locationBtnClick:(UIButton *)btn{
    BLLog(@"地区点击");
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
