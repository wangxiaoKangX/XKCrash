//
//  ViewController.m
//  XKSafeCrashDemo
//
//  Created by wangxiaokang on 2018/4/19.
//  Copyright © 2018年 wangxiaokang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setValue测试
    NSDictionary * dic = @{};
    [dic setValue:@"xk" forKey:@"name"];
    [dic setValue:@"beijing" forKeyPath:@"where"];
    
    // NSArray测试
    NSArray *array = @[@"xk",@"xkxk"];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:100];
    [array objectsAtIndexes:indexSet];
    
    NSString *nilStr = nil;
    NSArray *array1 = @[@"xk", nilStr, @"xkxk"];
    NSLog(@"%@",array1);
    
    
    NSArray *arr = @[@"xk", @"xkxk"];
    NSObject *object = arr[3];
    NSLog(@"object = %@",object);
    
    
    NSRange range = NSMakeRange(0, 100);
    __unsafe_unretained id cArray[range.length];
    [array getObjects:cArray range:range];

    
    // NSMutableArray
    NSMutableArray *muarray = @[@"name"].mutableCopy;
    NSObject *objectmu = muarray[2];
    //NSObject *object = [array objectAtIndex:20];
    NSLog(@"objectmu = %@",objectmu);
    
    NSMutableArray *array22 = @[@"name"].mutableCopy;
    array22[3] = @"iOS";
    
    NSMutableArray *array33 = @[@"name", @"namename"].mutableCopy;
    [array33 removeObjectAtIndex:5];
    
    NSMutableArray *array44 = @[@"name"].mutableCopy;

    //test1    beyond bounds
    [array44 insertObject:@"cool" atIndex:5];
    
//    NSMutableArray *array6 = @[@"name", @"namename"].mutableCopy;
    NSRange range6 = NSMakeRange(0, 11);
    __unsafe_unretained id cArray6[range6.length];
    [array getObjects:cArray6 range:range];
}

@end
