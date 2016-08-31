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
#import "BLMyOrderViewController.h"

#import "BLMyCollectViewController.h"
#import "BLMyAddressManagerViewController.h"
#import "BLFeedbackViewController.h"
#import "BLSettingViewController.h"

#import <UMSocial.h>

@interface BLMyViewController ()<BLTableHearderViewDelegate,UIAlertViewDelegate,UMSocialUIDelegate>
@property (nonatomic, strong) NSArray<NSArray *> *settingTitles;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) BLTableHearderView *hearderView;
@end

@implementation BLMyViewController

#pragma mark - Get Method
- (NSArray *)settingTitles{
    if([BLUserManager sharedUserManager].state == BLUserManagerStateLogIn){
        _settingTitles = @[
                           @[@"我的收藏&BLMyCollectViewController",@"地址管理&BLMyAddressManagerViewController"],
                           @[@"分享给好友&",@"用户反馈&BLFeedbackViewController",@"联系客服&FTAboutViewController",@"设置&BLSettingViewController"],
                           ];
    }else{
        _settingTitles = @[
                           @[@"我的收藏&BLMyCollectViewController",@"地址管理&BLMyAddressManagerViewController"],
                           @[@"分享给好友&",@"用户反馈&BLFeedbackViewController",@"联系客服&FTAboutViewController",@"设置&BLSettingViewController"],
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
    if ([titleName isEqualToString:@"联系客服"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"400-879-6699" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"呼叫", nil];
        [alertView show];
        return;
    }
    if ([titleName isEqualToString:@"分享给好友"]) {
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:@"578d91a667e58ecf5d003e1c"
                                          shareText:@"时光倒流,让家电完好如初"
                                         shareImage:[UIImage imageNamed:@"形状-4"]
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToQQ,UMShareToWechatSession,UMShareToWechatTimeline,nil]
                                           delegate:self];
        return;
    }
    if ([nibName hasPrefix:@"BL"]) {
        Class VCClass = NSClassFromString(nibName);
        UIViewController *VC = [[VCClass alloc] initWithNibName:nibName bundle:nil];
        VC.title = titleName;
        [self.navigationController pushViewController:VC animated:YES];
        return;
    }
}

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
- (void)tableHearderView:(BLTableHearderView *)tableHearderView didClickBtn:(UIButton *)btn withType:(BLTableHearderViewBtnClickType)type{
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
            VC = [[BLMyOrderViewController alloc] init];
            VC.title = btn.titleLabel.text;
            break;
        }
            
        default:
            break;
    }
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            break;
        case 1:{
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://400-879-6699"]]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://400-879-6699"]];
            }
            break;
        }
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
