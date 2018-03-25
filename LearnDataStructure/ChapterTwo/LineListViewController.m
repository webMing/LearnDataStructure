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
//0x7ffee9533e20
//0x7f8336f61000
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 测试线性表
    List _list = initLineList();
    for (int i = 0 ; i < MAXCOUNT ; i++ ) {
        _list.data[i] = 1;
    }
    
//    _list.data[MAXCOUNT] = {10.0f,0.0f,0.0f,0.0f,0.0f};
//    List_point p = &(_list);
    insertAtLast(&_list, 2.3);
    insertAtLast(&_list, 32.3);
    enumAllItems(&_list);
    free(&(_list));
//    free((struct Ste_List*)(*m));
//    printf("%p\n",p);
    
}

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

#pragma mark- 线性表数据结构

typedef struct Ste_List {
    int data[MAXCOUNT];
    int last; //data数组中最后一个下标索引 last < MAXCOUNT
}Ste_List;

                
/*
struct List {
    float value;
    int last ;
};
 */

struct Ste_List prtL; //定义一个结构体;
typedef struct Ste_List List; //定义创建“结构体”的快捷方式;
typedef struct Ste_List *List_point; //创建指向结构体指针的快捷方式;

#pragma mark- 线性表初始化

List initLineList() {
    List_point ste_list;
    ste_list = malloc(sizeof(List));
//    ste_list->data = {0.0,0.0,0.0,0.0,0.0};
    ste_list->last = -1; //初始化为-1
    //printf("malloc address :%p\n",ste_list);
    return *ste_list;
   
    /*
    另一种形式的初始化方法
    List* my_list;
    my_list = malloc(sizeof(List));
    my_list->last = -1;
     */
 
}

/*
List_point initLineList() {
    List_point ste_list;
    ste_list = malloc(sizeof(List));
    //    ste_list->data = {0.0,0.0,0.0,0.0,0.0};
    ste_list->last = -1; //初始化为-1
    printf("malloc address :%p\n",ste_list);
    return ste_list;
}
*/

#pragma mark- 给定一个Value查找在数组中的位置
// 给定一个值找出来,这个值所在的位置
int findIndex(List_point list,float value) {
    int i = 0;
    while (0 <= list->last && list->data[i] != value) {
        i++;
    }
    if (i > list->last) {
        return -1; //没有找到数值 返回-1
    }else {
        return i; //返回找到索引
    }
    //平均查找时间 (n+1)/2  O(n)
}

#pragma mark- 结尾插入操作
// 在结尾插入
bool insertAtLast(List_point list,float value) {
    if(list->last + 1 < MAXCOUNT) {
        list->last++;
        list->data[list->last] = value;
        return true;
    }else{
        return false;
    }
}
#pragma mark- 中间插入操作
// 约束条件 0 <= index <= list->last && MAXCOUNT - list->last > 1 表没有满
bool insertAtIndex(List_point list,float value,int index) {
    if(index >= 0 && MAXCOUNT - list->last > 1 && index <= list->last) {
        for (int i = list->last; i >= index; i--) {
            //注意移动的顺序从最后往前移动
            list->data[i+1] = list->data[i];
        }
        list->data[index] = value;
        list->last++;
        return true;
    }else{
        return false;
    }
    //平均移动次数 n/2; 平均性能 O(n)
}

#pragma mark- 删除操作--根据Value
// 数组中可能存在多个相同的值
void deleteByValue(List_point list,float value) {
    for (int i = 0; i <= list->last; i++) {
        if (list->data[i] == value) {
            for (int j = i; j < list->last; j++) {
                list->data[j] = list->data[j+1];
            }
        }
    }
    //时间复杂度O(n的平方)
    // 可以先找到Value对应的index, 然后根据各个index进行相应的删除操作;
}

#pragma mark- 删除操作--根据Index
bool deleteByIndex(List_point list,int index) {
    if (list->last >= index && index >=0 ) {
        for (int i = index; i < list->last; i++) {
            list->data[i] = list->data[i+1];
        }
        list->data[index] = 0.0f;
        list->last--;
        return true;
    }else{
        return false;
    }
}

#pragma mark- 遍历所有元素
void enumAllItems(List_point list) {
    for (int i = 0 ; i <= list->last; i++) {
        printf("value: %.2f",list->data[i]);
    }
}

- (NSString*)description {
    return @"This is Custom method!";
}
@end
