//
//  HHSingleton.h
//  demo
//
//  Created by 章展赫 on 15/8/9.
//  Copyright (c) 2015年 MrZ. All rights reserved.
//

// 单例头部分
#define HHSingletonH(methodName) + (instancetype)shared##methodName;

#if __has_feature(objc_arc) // 是ARC

// 单例头实现部分
#define HHSingletonM(methodName) \
\
+ (instancetype)shared##methodName \
{ \
return [[self alloc] init]; \
} \
\
+ (void)initialize \
{ \
static BOOL isInitialize = NO; \
if (!isInitialize) { \
instance = [[self alloc] init]; \
} \
} \
\
static id instance = nil; \
+ (id)allocWithZone:(struct _NSZone *)zone  \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
if (instance == nil) { \
instance = [super allocWithZone:zone]; \
} \
}); \
return instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return instance; \
} \
\
- (id)mutableCopyWithZone:(NSZone *)zone \
{ \
return instance; \
} \

#else // 不是ARC

// 单例头实现部分
#define HHSingleM(methodName) \
\
+ (instancetype)share##methodName \
{ \
return [[self alloc] init]; \
} \
\
+ (void)initialize \
{ \
static BOOL isInitialize = NO; \
if (!isInitialize) { \
instance = [[self alloc] init]; \
} \
} \
\
static id instance = nil; \
+ (id)allocWithZone:(struct _NSZone *)zone  \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
if (instance == nil) { \
instance = [super allocWithZone:zone]; \
} \
}); \
return instance; \
} \
\
- (oneway void)release \
{}  \
- (id)retain \
{ \
return instance; \
} \
- (NSUInteger)retainCount \
{ \
return 1; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return instance; \
} \
\
- (id)mutableCopyWithZone:(NSZone *)zone \
{ \
return instance; \
} \

#endif

