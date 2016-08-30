//
//  HHHttpTool.h
//  
//
//  Created by 章展赫 on 15/7/12.
//  Copyright (c) 2015年 MrZ. All rights reserved.
//   网络请求工具类：负责整个项目的所有HTTP请求

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef enum : NSUInteger {
    HHHttpToolResponseTypeJson, //默认
    HHHttpToolResponseTypeHTTP,
} HHHttpToolResponseType;

@class AFHTTPRequestOperation;
typedef  void (^successBlock)(NSURLSessionDataTask *task,id responseObject);
typedef  void (^failureBlock)(NSURLSessionDataTask *task,NSError *error);
typedef  void (^bodyBlock)(id<AFMultipartFormData> formData);
//typedef  void (^bodyBlock)((id <AFMultipartFormData> formData));

@interface HHHttpTool : NSObject
+ (void) startDebug;
+ (void) endDebug;

 
+ (void) get:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;
+ (void) get:(NSString *)url header:(NSDictionary *)headerParams params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

//post纯文本
+ (AFHTTPRequestOperation *) post:(NSString *)url context:(NSData *)context success:(successBlock)success failure:(failureBlock)failure;

+ (AFHTTPRequestOperation *) post:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;
+ (AFHTTPRequestOperation *) post:(NSString *)url params:(NSDictionary *)params body:(bodyBlock)body success:(successBlock)success failure:(failureBlock)failure;
+ (void) post:(NSString *)url params:(NSDictionary *)params header:(NSDictionary *)headerParams body:(bodyBlock)body success:(successBlock)success failure:(failureBlock)failure;
+ (void) post:(NSString *)url params:(NSDictionary *)params header:(NSDictionary *)headerParams footer:(HHHttpToolResponseType )footerParams body:(bodyBlock)body success:(successBlock)success failure:(failureBlock)failure;
@end
