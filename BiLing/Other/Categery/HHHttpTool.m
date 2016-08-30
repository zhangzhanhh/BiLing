//
//  HHHttpTool.m
//
//
//  Created by 章展赫 on 15/7/12.
//  Copyright (c) 2015年 MrZ. All rights reserved.
//  网络请求工具类：负责整个项目的所有HTTP请求

#import "HHHttpTool.h"
@implementation HHHttpTool

//是否进入调试打印状态
static bool _debug;

+ (void) get:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            if (_debug == YES) {
                NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
            }
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task,error);
        }
    }];
}

//+ (void)get:(NSString *)url header:(NSDictionary *)headerParams params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
//{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    //创建请求头
//    for (NSString *key in headerParams) {
//        [manager.requestSerializer setValue:headerParams[key] forHTTPHeaderField:key];
//    }
//    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (success) {
//            if (_debug == YES) {
//                NSLog(@"%@",[[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
//            }
//            success(operation,responseObject);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            if (_debug == YES) {
//                NSLog(@"%@",[[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
//            }
//            failure(operation,error);
//        }
//    }];
//}

//+ (AFHTTPRequestOperation *)post:(NSString *)url context:(NSData *)context success:(successBlock)success failure:(failureBlock)failure{
//    //配置请求
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
//    request.HTTPMethod = @"POST";
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    request.HTTPBody = context;
//    //创建操作
//    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        if (success) {
//            if (_debug == YES) {
//                NSLog(@"%@",[[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
//            }
//            success(operation,responseObject);
//        }
//    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//        if (failure) {
//            if (_debug == YES) {
//                NSLog(@"%@",[[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
//            }
//            failure(operation,error);
//        }
//    }];
//    //添加到操作队列中
//    [[AFHTTPRequestOperationManager manager].operationQueue addOperation:operation];
//    return operation;
//}
//
//+(AFHTTPRequestOperation *)post:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
//{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    AFHTTPRequestOperation *operation = [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (success) {
//            if (_debug == YES) {
//                NSLog(@"成功");
//                NSLog(@"%@",[[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
//            }
//            success(operation,responseObject);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            if (_debug == YES) {
//                NSLog(@"成功");
//                NSLog(@"%@",[[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
//            }
//            failure(operation,error);
//        }
//    }];
//    return operation;
//}
//
//+ (AFHTTPRequestOperation *)post:(NSString *)url params:(NSDictionary *)params body:(bodyBlock)body success:(successBlock)success failure:(failureBlock)failure{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    AFHTTPRequestOperation *operation = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        if (body) {
//            body(formData);
//        }
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (success) {
//            if (_debug == YES) {
//                NSLog(@"成功");
//                NSLog(@"%@",[[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
//            }
//            success(operation,responseObject);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            if (_debug == YES) {
//                NSLog(@"失败");
//                NSLog(@"%@",[[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
//            }
//            failure(operation,error);
//        }
//    }];
//    return operation;
//}
//
//+ (void)post:(NSString *)url params:(NSDictionary *)params header:(NSDictionary *)headerParams body:(bodyBlock)body success:(successBlock)success failure:(failureBlock)failure{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    //创建请求头
//    for (NSString *key in headerParams) {
//        [manager.requestSerializer setValue:headerParams[key] forHTTPHeaderField:key];
//    }
//    [self post:url params:params body:body success:success failure:failure];
//}
//
//+ (void)post:(NSString *)url params:(NSDictionary *)params header:(NSDictionary *)headerParams footer:(HHHttpToolResponseType)footerParams body:(bodyBlock)body success:(successBlock)success failure:(failureBlock)failure{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    //创建请求头
//    for (NSString *key in headerParams) {
//        [manager.requestSerializer setValue:headerParams[key] forHTTPHeaderField:key];
//    }
//    //指定返回文件形式footer
//    switch (footerParams) {
//        case HHHttpToolResponseTypeJson:
//            //AFN默认
//            break;
//        case HHHttpToolResponseTypeHTTP:
//            //初始化http响应解析器
//            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//            break;
//        default:
//            break;
//    }
//    [self post:url params:params body:body success:success failure:failure];
//}


+ (void)startDebug{
    _debug = YES;
}

+ (void)endDebug{
    _debug = NO;
}


/*邮箱验证 MODIFIED BY HELENSONG*/
-(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/*手机号码验证 MODIFIED BY HELENSONG*/
-(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

/*车牌号验证 MODIFIED BY HELENSONG*/
BOOL validateCarNo(NSString* carNo)
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}

@end
