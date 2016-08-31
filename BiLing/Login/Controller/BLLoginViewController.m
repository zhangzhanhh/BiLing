//
//  BLLoginViewController.m
//  BiLing
//
//  Created by 章展赫 on 16/8/30.
//  Copyright © 2016年 MrZ. All rights reserved.
//

#import "BLLoginViewController.h"
#import "BLLoginBtn.h"

@interface BLLoginViewController ()
#pragma mark 登陆界面属性
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet BLLoginBtn *loginBtn;
@property (weak, nonatomic) IBOutlet BLLoginBtn *registerBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *passworldTextField;
@property (weak, nonatomic) IBOutlet UIButton *login;
#pragma mark 注册界面属性
@property (weak, nonatomic) IBOutlet UIView *registerView;
@property (weak, nonatomic) IBOutlet UIButton *getRegisterCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberRegtisterTF;
@property (weak, nonatomic) IBOutlet UIView *registerCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *passworldRegisterTF;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn_register;
@end

@implementation BLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
    [self setupView];
}

- (void)setupNavBar{
    UIImage *image = [UIImage imageNamed:@"navigationbar_button_background"];
    [self.navigationController.navigationBar setBackgroundImage:image
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:image];
}

- (void)setupView{
    self.view.backgroundColor = kBgColor;
    self.loginView.backgroundColor = kBgColor;
    
    self.login.layer.cornerRadius = 8;
    self.login.layer.masksToBounds = YES;
    self.getRegisterCodeBtn.layer.cornerRadius = 5;
    self.getRegisterCodeBtn.layer.masksToBounds = YES;
    self.registerBtn_register.layer.cornerRadius = 8;
    self.registerBtn_register.layer.masksToBounds = YES;
}

#pragma mark - btnClick
- (IBAction)loginChooseBtnClick:(BLLoginBtn *)sender {
    self.registerBtn.selected = NO;
    self.loginBtn.selected = YES;
    self.loginView.hidden = NO;
    self.registerView.hidden = YES;
}
- (IBAction)registerBtnClick:(BLLoginBtn *)sender {
    self.registerBtn.selected = YES;
    self.loginBtn.selected = NO;
    self.loginView.hidden = YES;
    self.registerView.hidden = NO;
}
- (IBAction)loginBtnClick:(UIButton *)sender {
}
- (IBAction)forgetPassworldBtnClick:(UIButton *)sender {
}
- (IBAction)qqLoginBtnClick:(UIButton *)sender {
}
- (IBAction)weChatBtnClick:(UIButton *)sender {
}
- (IBAction)getRegisterCodeBtnClick:(UIButton *)sender {
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
