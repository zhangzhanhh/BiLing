//
//  BLBalanceViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLBalanceViewController.h"
#import "BLBalanceTabelHearderView.h"
#import "BLBalanceTableViewCell.h"
#import "BLBanlanceCellModel.h"
#import "UIBarButtonItem+MJ.h"

#define BLBalanceTableViewCellReuserID @"BLBalanceTableViewCellReuserID"

@interface BLBalanceViewController ()<BLBalanceTabelHearderViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<BLBanlanceCellModel *> *models;
@end

@implementation BLBalanceViewController

#pragma mark - Get Method
- (NSArray *)models
{
    if (_models == nil){
        BLBanlanceCellModel *model = [[BLBanlanceCellModel alloc] initWithImageName:@"tx" title:@"提现"];
        BLBanlanceCellModel *model1 = [[BLBanlanceCellModel alloc] initWithImageName:@"mx" title:@"交易明细"];
        BLBanlanceCellModel *model2 = [[BLBanlanceCellModel alloc] initWithImageName:@"yhk" title:@"银行卡管理"];
        BLBanlanceCellModel *model3 = [[BLBanlanceCellModel alloc] initWithImageName:@"mm" title:@"密码管理"];
        _models = @[model,model1,model2,model3];
    }
    return _models;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的钱包";
    [self setupTableView];
    [self setupNavbar];
}

- (void)setupTableView{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BLBalanceTableViewCell class]) bundle:nil] forCellReuseIdentifier:BLBalanceTableViewCellReuserID];
    BLBalanceTabelHearderView *hearder = [BLBalanceTabelHearderView loadViewFromNib];
    hearder.delegate = self;
    self.tableView.tableHeaderView = hearder;
    self.tableView.tableFooterView = [UIView new];
}

- (void)setupNavbar{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"shuaxin" highIcon:@"shuaxin" target:self action:@selector(refreshBtnClick)];
}

- (void)refreshBtnClick{
    BLLog(@"刷新");
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BLBalanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BLBalanceTableViewCellReuserID];
    cell.model = self.models[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
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
