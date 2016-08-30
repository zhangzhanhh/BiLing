//
//  BLMyViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/29.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLMyViewController.h"
#import "BLUserManager.h"
#import "BLTableHearderView.h"
#import "BLMyInfoViewController.h"
#import "BLBalanceViewController.h"
#import "BLLoginViewController.h"

@interface BLMyViewController ()<BLTableHearderViewDelegate>
@property (nonatomic, strong) NSArray<NSArray *> *settingTitles;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) BLTableHearderView *hearderView;
@end

@implementation BLMyViewController

#pragma mark - Get Method
- (NSArray *)settingTitles{
    if([BLUserManager sharedUserManager].state == BLUserManagerStateLogIn){
        _settingTitles = @[
                           @[@"我的收藏&FTChangePassworldViewController",@"地址管理&FTOrderHistoryViewController"],
                           @[@"分享给好友&",@"用户反馈&",@"联系客服&FTAboutViewController",@"设置&"],
                           ];
    }else{
        _settingTitles = @[
                           @[@"我的收藏&FTChangePassworldViewController",@"地址管理&FTOrderHistoryViewController"],
                           @[@"分享给好友&",@"用户反馈&",@"联系客服&FTAboutViewController",@"设置&"],
                           ];
    }
    return _settingTitles;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self setUpTableView];
    
}

- (void)setUpTableView{
    self.hearderView = [BLTableHearderView loadViewFromNib];
    self.hearderView.delegate = self;
    self.tableView.tableHeaderView = self.hearderView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.settingTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.settingTitles[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 标题
    NSString *titleName = [self.settingTitles[indexPath.section][indexPath.row] componentsSeparatedByString:@"&"].firstObject;
    // cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FTSettingViewCellReuse"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"FTSettingViewCellReuse"];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = titleName;
    cell.textLabel.font = FONT(13);
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
    }}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

#pragma mark - BLTableHearderViewDelegate
- (void)tableHearderView:(BLTableHearderView *)tableHearderView didClickBtnWithType:(BLTableHearderViewBtnClickType)type{
    UIViewController *VC = nil;
    switch (type) {
        case BLTableHearderViewUserIconBtnClick:{
            VC = [[BLMyInfoViewController alloc] init];
            break;
        }
        case BLTableHearderViewLoginBtnClick:{
            VC = [[BLLoginViewController alloc] init];
            break;
        }
        case BLTableHearderViewConutBtnClick:{
            VC = [[BLBalanceViewController alloc] init];
            break;
        }
        case BLTableHearderViewRedBagBtnClick:{
            
            break;
        }
        case BLTableHearderViewOtherBtnClick:{
            
            break;
        }
            
        default:
            break;
    }
    [self.navigationController pushViewController:VC animated:YES];
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
