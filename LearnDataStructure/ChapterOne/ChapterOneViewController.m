//
//  ViewController.m
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/20.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "ChapterOneViewController.h"
#import <objc/runtime.h>

@interface ChapterOneViewController ()

@end

@implementation ChapterOneViewController


#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    clock_t beginTime;
    beginTime = clock();
    /*NumberValue   printNumTypeOnoTimes(递归)    printNumTypeTwoTimes(迭代)                                                 1000                1345                       82894
        10000               14104                      85280
        100000              129079                     722970
        1000000             崩溃                        7046975
        (Mac 模拟器)当数值比较小的时候计算(递归)在计算时间上有优势,
        但是当数值比较大的时候递归所消耗的内容比迭代大的多.
     */
    printNumTypeOne(100000);
//    printNumTypeTwo(100000);
    printf("time interval:%lu",clock() - beginTime);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

void printNumTypeOne(int num) {
    if (num) {
        printNumTypeOne(num - 1);
        printf("%d\n",num);
    }
}

void printNumTypeTwo(int num) {
    for (int i = 0; i < num; i++) {
        NSLog(@"%d\n",i);
    }
}


@end
