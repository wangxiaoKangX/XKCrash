//
//  NSObject+XKSafe.m
//  CrashTest
//
//  Created by 王晓康 on 2018/4/17.
//  Copyright © 2018年 wangxiaokang. All rights reserved.
//

#import "NSObject+XKSafe.h"
#import <objc/runtime.h>

@implementation NSObject (XKSafe)

// 类方法
+ (void)swizzleClassMethod:(Class)currentClass methodSEL_1:(SEL)methodSEL_1 methodSEL_2:(SEL)methodSEL_2
{
    Method method1 = class_getClassMethod(currentClass, methodSEL_1);
    Method method2 = class_getClassMethod(currentClass, methodSEL_2);
    method_exchangeImplementations(method1, method2);
}

// 实例方法
+ (void)swizzleInstanceMethod:(Class)currentClass methodSEL_1:(SEL)methodSEL_1 methodSEL_2:(SEL)methodSEL_2
{
    Method originalMethod = class_getInstanceMethod(currentClass, methodSEL_1);
    Method swizzledMethod = class_getInstanceMethod(currentClass, methodSEL_2);
    
//    BOOL isAddMethod =
//    class_addMethod(currentClass,
//                    methodSEL_1,
//                    method_getImplementation(swizzledMethod),
//                    method_getTypeEncoding(swizzledMethod));
//
    
//    if (didAddMethod) {
//        class_replaceMethod(anClass,
//                            method2Sel,
//                            method_getImplementation(originalMethod),
//                            method_getTypeEncoding(originalMethod));
//    }
    
    
    BOOL isAddMethod = class_addMethod(currentClass, methodSEL_1, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (isAddMethod)
    {
        class_replaceMethod(currentClass, methodSEL_2, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
