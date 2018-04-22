//
//  NSObject+XKSafe.h
//  CrashTest
//
//  Created by wangxiaokang on 2018/4/17.
//  Copyright © 2018年 wangxiaokang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XKSafe)

// 类方法
+ (void)swizzleClassMethod:(Class)currentClass methodSEL_1:(SEL)methodSEL_1 methodSEL_2:(SEL)methodSEL_2;

// 实例方法
+ (void)swizzleInstanceMethod:(Class)currentClass methodSEL_1:(SEL)methodSEL_1 methodSEL_2:(SEL)methodSEL_2;

@end
