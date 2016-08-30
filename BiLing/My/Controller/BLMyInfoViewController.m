//
//  BLMyInfoViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLMyInfoViewController.h"
#import "BLMyInfoTableViewCell.h"
#import "BLMyInfoTabelHeardView.h"

#define BLMyInfoTableViewCellReuseID @"BLMyInfoTableViewCellReuseID"

@interface BLMyInfoViewController ()<BLMyInfoTabelHeardViewDelegate>
@property (nonatomic, strong) NSArray<NSArray *> *settingTitles;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation BLMyInfoViewController

#pragma mark - Get Method
- (NSArray *)settingTitles{
    _settingTitles = @[
                       @[@"姓名&实名认证&FTChangePassworldViewController",@"性别&请选择&FTOrderHistoryViewController",@"职业&请选择&FTOrderHistoryViewController",@"年龄层&请选择&FTOrderHistoryViewController",@"地址&请输入&FTOrderHistoryViewController"],
                       @[@"手机&13365615564&FTOrderHistoryViewController",@"邮箱&请输入&FTOrderHistoryViewController"],
                       ];
    return _settingTitles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人信息";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BLMyInfoTableViewCell class]) bundle:nil] forCellReuseIdentifier:BLMyInfoTableViewCellReuseID];
    
    BLMyInfoTabelHeardView *hearder = [BLMyInfoTabelHeardView loadViewFromNib];
    hearder.delegate = self;
    self.tableView.tableHeaderView = hearder;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.settingTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.settingTitles[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BLMyInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BLMyInfoTableViewCellReuseID];
    cell.titleLabel.text = [self.settingTitles[indexPath.section][indexPath.row] componentsSeparatedByString:@"&"].firstObject;
    cell.detailLabel.text = [self.settingTitles[indexPath.section][indexPath.row] componentsSeparatedByString:@"&"][1];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 标题
    NSString *titleName = [self.settingTitles[indexPath.section][indexPath.row] componentsSeparatedByString:@"&"].firstObject;
    // 类名
    NSString *nibName = [self.settingTitles[indexPath.section][indexPath.row] componentsSeparatedByString:@"&"].lastObject;
    if ([nibName hasPrefix:@"BL"]) {
        Class VCClass = NSClassFromString(nibName);
        UIViewController *VC = [[VCClass alloc] initWithNibName:nibName bundle:nil];
        VC.title = titleName;
        [self.navigationController pushViewController:VC animated:YES];
        return;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

#pragma mark - BLMyInfoTabelHeardViewDelegate
- (void)myInfoTabelHeardView:(BLMyInfoTabelHeardView *)tabelHeardView didClickBtnWithType:(BLMyInfoTabelHeardViewClickBtnType)type{
    switch (type) {
        case BLMyInfoTabelHeardViewIconBtnClick:{
            
            break;
        }
        case BLMyInfoTabelHeardViewUploadImageBtnClick:{
            
            break;
        }
        default:
            break;
    }
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
