//
//  FTUserManager.m
//  CZJiaZheng
//
//  Created by 章展赫 on 16/3/20.
//  Copyright © 2014年 MrZ. All rights reserved.
//

#import "BLUserManager.h"
#import "HHHttpTool.h"

#define FTUserInfoSavePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"userInfo.arc"]

#define FTTestUserName @"123"
#define FTTestPassWorld @"123"

@interface BLUserManager ()
@property (nonatomic, copy) NSString *abc;
@end

@implementation BLUserManager

HHSingletonM(UserManager);

- (instancetype)init
{
    self = [super init];
    if (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            //do something
            //默认未登陆
            [self willChangeValueForKey:@"state"];
            _state = BLUserManagerStateLogOut;
            [self didChangeValueForKey:@"state"];
            _currentAccount = BLDecode(FTUserInfoSavePath);
            if (_currentAccount) {
                //已登录
                [self willChangeValueForKey:@"state"];
                _state = BLUserManagerStateLogIn;
                [self didChangeValueForKey:@"state"];
            }
        });
    }
    return self;
}

/** 刷新状态 */
- (void)refreshState{
    [self willChangeValueForKey:@"state"];
    [self didChangeValueForKey:@"state"];
}

/** 登出 */
- (void)logout{
    if (_currentAccount) {
        //清空本地缓存
        [[NSFileManager defaultManager] removeItemAtPath:FTUserInfoSavePath error:nil];
        //清空缓存
        _currentAccount = nil;
        //未登录
        [self willChangeValueForKey:@"state"];
        _state = BLUserManagerStateLogOut;
        [self didChangeValueForKey:@"state"];
        return;
    }
    BLLog(@"未登录");
}

/** 登录 */
- (void)login:(FTUserModel *)model{
    
    if (!_currentAccount) {
        
//        self.abc = model.user_password;
//#warning 测试
//        if ([model.user_phone isEqualToString:FTTestUserName] && [model.user_password isEqualToString:FTTestPassWorld]) {
//            [self willChangeValueForKey:@"state"];
//            _state = FTUserManagerStateLogIn;
//            [self didChangeValueForKey:@"state"];
//            _currentAccount = model;
//            [self saveAccount:model];
//            return;
//        }
//        NSLog(@"%@",[model mj_keyValues]);
//        NSData *data = FTJsonEncode([model mj_keyValues]);
//        
//        @weakify(self);
//        [HHHttpTool post:FTZLSeverPathAppend(@"czoto_app/user/login.php") context:data success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            @strongify(self);
//            if ([FTJsonDecode(responseObject)[@"code"] isEqualToString:@"200"]) {
//                [MBProgressHUD showSuccess:@"登陆成功"];
//                [HHHttpTool post:FTZLSeverPathAppend(@"czoto_app/user/userInfo.php") context:FTJsonEncode(@{@"phone":model.user_phone}) success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                    FTUserModel *model = [FTUserModel new];
//                    NSDictionary *responseDic = FTJsonDecode(responseObject)[@"data"];
//                    model.nick_name = dicGetStringSafe(responseDic, @"user_name");
//                    model.user_address = dicGetStringSafe(responseDic, @"address");
//                    model.user_icon = dicGetStringSafe(responseDic, @"icon");
//                    model.user_phone = dicGetStringSafe(responseDic, @"phone");
//                    model.user_id = dicGetStringSafe(responseDic, @"id");
//                    model.wallet = dicGetInt(responseDic, @"wallet", 0);
//                    model.user_password = self.abc;
//                    [self saveAccount:model];
//                    [self willChangeValueForKey:@"currentAccount"];
//                    _currentAccount = model;
//                    [self didChangeValueForKey:@"currentAccount"];
//                    [self willChangeValueForKey:@"state"];
//                    _state = FTUserManagerStateLogIn;
//                    [self didChangeValueForKey:@"state"];
//                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                    
//                }];
//            }
//            if ([FTJsonDecode(responseObject)[@"code"] isEqualToString:@"400"]) {
//                [MBProgressHUD showError:@"登陆失败"];
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//        }];
    }else{
        BLLog(@"您已登录");
    }
}

/** 注册 */
- (void)registe:(FTUserModel *)model{
//    NSData *data = FTJsonEncode([model mj_keyValues]);
//    NSLog(@"%@",[model mj_keyValues]);
////    NSLog(@"%@", [[NSKeyedUnarchiver unarchiveObjectWithData: FTEncode(model)] user_phone]);
//    [HHHttpTool post:FTZLSeverPathAppend(@"czoto_app/user/register.php") context:data success:^(AFHTTPRequestOperation *operation, id responseObject) {
//      //  NSLog(@"%@",FTJsonDecode(responseObject));
//        if ([FTJsonDecode(responseObject)[@"code"] isEqualToString:@"200"]){
//            [MBProgressHUD showSuccess:@"注册成功"];
//        }
//        if ([FTJsonDecode(responseObject)[@"code"] isEqualToString:@"400"]){
//            [MBProgressHUD showError:@"注册失败"];
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    }];
}

/** 修改密码 */
- (void)changePasswold:(FTUserModel *)model{
    
}

/** 打电话 */
- (void)callTelephoneNumber:(NSString *)number{
    //[self btnClick];
}

/** 当前账号信息 */
- (FTUserModel *)getCurrentAccount{
    if (_currentAccount) {
        return _currentAccount;
    }
    BLLog(@"请登录");
    return nil;
}

#pragma mark 私有
- (void)saveAccount:(FTUserModel *)model{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    [data writeToFile:FTUserInfoSavePath atomically:YES];
}
@end
