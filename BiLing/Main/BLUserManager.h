//
//  FTUserManager.h
//  CZJiaZheng
//
//  Created by 章展赫 on 14/3/20.
//  Copyright © 2014年 MrZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
@class FTUserModel;

typedef enum : NSUInteger {
    BLUserManagerStateLogIn, //登录状态
    BLUserManagerStateLogOut, //未登录状态
} BLUserManagerState;

@interface BLUserManager : NSObject

HHSingletonH(UserManager);

/** 刷新状态 */
- (void)refreshState;

/** 当前用户 */
@property (strong, nonatomic, readonly) FTUserModel *currentAccount;

/** 登录状态 */
@property (nonatomic, assign, readonly) BLUserManagerState state;

/** 登录 */
- (void)login:(FTUserModel *)model;

/** 登出 */
- (void)logout;

/** 注册 */
- (void)registe:(FTUserModel *)model;

/** 修改密码 */
- (void)changePasswold:(FTUserModel *)model;

/** 打电话 */
- (void)callTelephoneNumber:(NSString *)number;

/** 当前账号信息 */
- (FTUserModel *)getCurrentAccount;

- (void)saveAccount:(FTUserModel *)model;

@end
