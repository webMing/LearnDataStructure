//
//  LineListViewController.m
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/21.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

/*
 一种线性表的实现
 */

#define MAXCOUNT 5
#import "LineListViewController.h"

@interface LineListViewController ()

@end

@implementation LineListViewController


#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

#pragma mark- 线性表数据结构

typedef struct Ste_List {
    float data[MAXCOUNT];
    int last;
}ste_list;

struct List {
    float value;
    int last ;
};
struct Ste_List prtL; //定义一个结构体;
typedef struct Ste_List List; //定义创建“结构体”的快捷方式;
typedef struct Ste_List *List_point; //创建指向结构指针的快捷方式;

#pragma mark- 线性表初始化

List initLineList() {
    List_point ste_list;
    ste_list = malloc(sizeof(ste_list));
    ste_list->last = -1;
    return *ste_list;
    
    /*
    另一种形式的初始化方法
    List* my_list;
    my_list = malloc(sizeof(List));
    my_list->last = -1;
    */
}

int findIndex(List_point list,float value) {
    int i = 0;
    while (0 < list->last && list->data[i] != value) {
        i++;
    }
    if (i > list->last) {
        return -1;
    }else {
        return i;
    }
}

@end
