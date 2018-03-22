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
    int array[] = {1,32,4,56,23,4,6,8,-1};
    bubbleSort(array,9);
    for (int i = 0 ; i < 9 ; i++) {
        printf("%d\n",array[i]);
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[self printNumTest];
//    [self multinomialTest];
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

#define Counter 100000
// 多项式求和
- (void)multinomialTest {
    // 求公式的和 f(n) = a0 + a1*x*x + a2*x*x*x + a3*x*x*x*x ....... an*pow(x,n)
    clock_t beginTime;
    beginTime = clock();
    // 生成所需数据
    double numArray[Counter] = {0.0};
    for (int num = 0;num < Counter ; num++) {
        numArray[num] = num * 0.41;
    }
    for (int time = 0 ; time < 10; time++) {
            multinomialTestTypeOne(Counter,numArray,0.2);
//        multinomialTestTypeTwo(Counter,numArray,0.2);
    }
    printf("time interval:%lu",(clock() - beginTime)); //以秒为单位
    
    /*
     执行一次所耗费时间太短不到1个colock(),添加一个for循环来增大耗时,然后除以time得出每次消耗时间
     time   multinomialTestTypeOne  multinomialTestTypeTwo
     10     24521                    10277
     100    239755                   101132
     1000   2291599                  996110
     */
}

void  multinomialTestTypeOne(int n, double a[], double x) {
    double p = a[0];
    for (int i = 1 ; i <= n; i++) {
        p += a[i] * pow(x, i);
    }
    printf("result : %f\n",p);
}

void  multinomialTestTypeTwo(int n, double a[], double x) {
    double p = 0.0;
    for (int i = n ; i > 0; i--) {
        p = a[i-1] + x * p;
    }
    printf("result : %f\n",p);
}

- (void)printNumTest {
    
    clock_t beginTime;
    beginTime = clock();
    /*NumberValue   printNumTypeOnoTimes(递归)    printNumTypeTwoTimes(迭代)                                                 1000                1345                       82894
     10000               14104                      85280
     100000              129079                     722970
     1000000             崩溃                        7046975
     (Mac 模拟器)当数值比较小的时候计算(递归)在计算时间上有优势,
     但是当数值比较大的时候递归所消耗的内容比迭代大的多.
     */
//    printNumTypeOne(100000);
      printNumTypeTwo(100000);
    printf("time interval:%lu",(clock() - beginTime)/CLOCKS_PER_SEC);
}

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


#pragma mark- 选择排序
void selectionSort(int list[],int lenth) {
    //从大到小的排序
    for (int index = 0; index < lenth; index++) {
        //从index到lenth-1中找到最大的一个数字的索引
        int currentIndex = index;
        int maxValue = list[index];
        for (int i = index + 1; i < lenth; i++) {
            if (maxValue < list[i]) {
                maxValue = list[i];
                currentIndex = i;
            }
        }
        // 交换两个数据
        int swap = list[currentIndex];
        list[currentIndex] = list[index];
        list[index] = swap;
    }
}

void bubbleSort(int list[],int lenth){
    for (int i = 0; i < lenth; i++) {
        //从index到lenth-1中找到最大的一个数字的索引
        int swapValue = 0;
        for (int j = i + 1; j < lenth; j++) {
            if (list[i] > list[j]) {
                /*
                swapValue = list[i];
                list[i] = list[j];
                list[j] = swapValue;
                */
                list[i] = list[i] + list[j];
                list[j] = list[i] - list[j];
                list[i] = list[i] - list[j];
            }
        }
        /*交换两个数据
         A = A + B;
         B = A - B:
         A = A - B;
         */
        
    }
}



// 迭代
void printNumFun_1(int num) {
    for (int i = 0; i < num; i++) {
        printf("Current Num Value :%d",num);
    }
}
// 递归
void printNumFun_2(int num) {
    // 当num足够大的时候内存爆掉
    if(num) {
        printNumFun_2(num - 1);
        printf("Current Num Value :%d",num);
    }
}
// 实验数据 num 1000,10000,100000,1000000 可以看下效果

@end
