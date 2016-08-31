//
//  BLMyOrderChildViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/31.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLMyOrderChildViewController.h"
#import "BLMyOrderChildTableViewCell.h"

#define BLMyOrderChildTableViewCellReuseID @"BLMyOrderChildTableViewCellReuseID"

@interface BLMyOrderChildViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BLMyOrderChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BLMyOrderChildTableViewCell class]) bundle:nil] forCellReuseIdentifier:BLMyOrderChildTableViewCellReuseID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    CGFloat bottom = 0;
    CGFloat top = BLTitilesViewH + NAV_BAR_HEIGHT;
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BLMyOrderChildTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BLMyOrderChildTableViewCellReuseID];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
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
