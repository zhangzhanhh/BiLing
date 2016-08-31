//
//  BLMyCollectViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/31.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLMyCollectViewController.h"
#import "BLMyCollectTableViewCell.h"

#define BLMyCollectTableViewCellReuseID @"BLMyCollectTableViewCellReuseID"

@interface BLMyCollectViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BLMyCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BLMyCollectTableViewCell class]) bundle:nil] forCellReuseIdentifier:BLMyCollectTableViewCellReuseID];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BLMyCollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BLMyCollectTableViewCellReuseID];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
