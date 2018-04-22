//
//  NSArray+XKSafe.m
//  CrashTest
//
//  Created by wangxiaokang on 2018/4/17.
//  Copyright © 2018年 wangxiaokang. All rights reserved.
//

#import "NSArray+XKSafe.h"
#import "NSObject+XKSafe.h"

@implementation NSArray (XKSafe)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        /*class类方法*/
        [NSObject swizzleClassMethod:[self class] methodSEL_1:@selector(arrayWithObjects:count:) methodSEL_2:@selector(XKSafeArrayWithObjects:count:)];
        
        /*实例方法-分不同类簇*/
        Class __NSArray = NSClassFromString(@"NSArray");
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class __NSArray0 = NSClassFromString(@"__NSArray0");
        
    
        [NSObject swizzleInstanceMethod:__NSArray methodSEL_1:@selector(objectsAtIndexes:) methodSEL_2:@selector(XKSafeObjectsAtIndexes:)];
        
        //objectAtIndex:
        [NSObject swizzleInstanceMethod:__NSArrayI methodSEL_1:@selector(objectAtIndex:) methodSEL_2:@selector(NSArrayI_XKSafeObjectAtIndex:)];
        
        [NSObject swizzleInstanceMethod:__NSArray0 methodSEL_1:@selector(objectAtIndex:) methodSEL_2:@selector(NSArray0_XKSafeObjectAtIndex:)];
        
        [NSObject swizzleInstanceMethod:__NSSingleObjectArrayI methodSEL_1:@selector(objectAtIndex:) methodSEL_2:@selector(NSSingleObjectArrayI_XKSafeObjectAtIndex:)];
        
        //getObjects:range:
        [NSObject swizzleInstanceMethod:__NSArray methodSEL_1:@selector(getObjects:range:) methodSEL_2:@selector(NSArray_XKSafeGetObjects:range:)];
        
        [NSObject swizzleInstanceMethod:__NSArrayI methodSEL_1:@selector(getObjects:range:) methodSEL_2:@selector(NSArrayI_XKSafeGetObjects:range:)];
        
        [NSObject swizzleInstanceMethod:__NSSingleObjectArrayI methodSEL_1:@selector(getObjects:range:) methodSEL_2:@selector(NSSingleObjectArrayI_XKSafeGetObjects:range:)];
        
        // objectAtIndexedSubscript
//        if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0)
//        {
            [NSObject swizzleInstanceMethod:__NSArrayI methodSEL_1:@selector(objectAtIndexedSubscript:) methodSEL_2:@selector(NSArrayI_XKSafeObjectAtIndexedSubscript:)];
//        }
    });
}

/**
 类方法初始化数组
 */
+ (instancetype)XKSafeArrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt
{
    id instance = nil;
    
    @try {
        instance = [self XKSafeArrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"数组初始化方法异常");
        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self XKSafeArrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}

#pragma mark - objectsAtIndexes:
- (NSArray *)XKSafeObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self XKSafeObjectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"ObjectsAtIndexes-方法异常");
        
    } @finally {
        return returnArray;
    }
}

#pragma mark - objectAtIndex:
//__NSArrayI  objectAtIndex:
- (id)NSArrayI_XKSafeObjectAtIndex:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self NSArrayI_XKSafeObjectAtIndex:idx];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        return object;
    }
    
}

//__NSArray0 objectAtIndex:
- (id)NSArray0_XKSafeObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self NSArray0_XKSafeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        return object;
    }
}

//__NSSingleObjectArrayI objectAtIndex:
- (id)NSSingleObjectArrayI_XKSafeObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self NSSingleObjectArrayI_XKSafeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        return object;
    }
}

#pragma mark - getObjects:range:
//NSArray getObjects:range:
- (void)NSArray_XKSafeGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self NSArray_XKSafeGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSLog(@"exception = %@",exception);
        NSLog(@"getObjects:range:-方法异常");
        
    } @finally {
        
    }
}

//__NSArrayI  getObjects:range:
- (void)NSArrayI_XKSafeGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self NSArrayI_XKSafeGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSLog(@"exception = %@",exception);
        NSLog(@"getObjects:range:-方法异常");
        
    } @finally {
        
    }
}

//__NSSingleObjectArrayI  getObjects:range:
- (void)NSSingleObjectArrayI_XKSafeGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self NSSingleObjectArrayI_XKSafeGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSLog(@"exception = %@",exception);
        NSLog(@"getObjects:range:-方法异常");
        
    } @finally {
        
    }
}

#pragma mark - objectAtIndexedSubscript:
- (id)NSArrayI_XKSafeObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self NSArrayI_XKSafeObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"NSArrayI_XKSafeObjectAtIndexedSubscript:-方法异常");
    }
    @finally {
        return object;
    }
    
}

@end


@implementation NSMutableArray (XKSafe)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        //objectAtIndex:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(objectAtIndex:) methodSEL_2:@selector(XKSafeObjectAtIndex:)];
        
        //setObject:atIndexedSubscript:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(setObject:atIndexedSubscript:) methodSEL_2:@selector(XKSafeSetObject:atIndexedSubscript:)];
        
        //removeObjectAtIndex:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(removeObjectAtIndex:) methodSEL_2:@selector(XKSafeRemoveObjectAtIndex:)];
        
        //insertObject:atIndex:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(insertObject:atIndex:) methodSEL_2:@selector(XKSafeInsertObject:atIndex:)];
        
        //getObjects:range:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(getObjects:range:) methodSEL_2:@selector(XKSafeGetObjects:range:)];
        
        //objectAtIndexedSubscript
//        if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0)
//        {
            [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(objectAtIndexedSubscript:) methodSEL_2:@selector(NSArrayM_XKSafeMuObjectAtIndexedSubscript:)];
//        }
    });
}

#pragma mark - objectAtIndex:
- (id)XKSafeObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self XKSafeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"objectAtIndex = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        return object;
    }
}

#pragma mark - get object from array
- (void)XKSafeSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    
    @try {
        [self XKSafeSetObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSLog(@"get object from array = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        
    }
}

#pragma mark - removeObjectAtIndex:
- (void)XKSafeRemoveObjectAtIndex:(NSUInteger)index {
    @try {
        [self XKSafeRemoveObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"removeObjectAtIndex = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        
    }
}

#pragma mark - set方法
- (void)XKSafeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self XKSafeInsertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"set = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        
    }
}

#pragma mark - getObjects:range:
- (void)XKSafeGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self XKSafeGetObjects:objects range:range];
    } @catch (NSException *exception) {
        NSLog(@"getObjects = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
        
    } @finally {
        
    }
}

#pragma mark - MuObjectAtIndexedSubscript:
- (id)NSArrayM_XKSafeMuObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self NSArrayM_XKSafeMuObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSLog(@"getObjects = %@",exception);
        NSLog(@"MuObjectAtIndexedSubscript-方法异常");
    }
    @finally {
        return object;
    }
    
}

@end


