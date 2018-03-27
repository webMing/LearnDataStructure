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

//0x00007ffee13efe40 140732677422656
//0x00006000000155b0 105553116353968
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   
    // 测试线性表
    ste_list list = {{1,1,1,1,1},-1};
    ste_list_pointer list_pointer = initLineList();
//    for (int i = 0 ; i < MAXCOUNT ; i++ ) {
//        list_pointer->data[i] = 1;
//    }
// _list.data[MAXCOUNT] = {10.0f,0.0f,0.0f,0.0f,0.0f};
    //insertAtLast(list_pointer, 1);
    insertAtLast(list_pointer, 2);
    //deleteByIndex(list_pointer, 0);
    insertAtLast(list_pointer, 3);
    insertAtLast(list_pointer, 4);
    insertAtIndex(list_pointer, 5, 1);
    insertAtIndex(list_pointer, 51,0);
//    insertAtLast(list_pointer, 132);
//    insertAtLast(list_pointer, 332);
//    deleteByValue(list_pointer, 2);
//    insertAtLast(list_pointer, 332);
//    deleteByValue(list_pointer, 32);
    enumAllItems(list_pointer);
    printf("find index;%d",findIndex(list_pointer, 5));
    free(list_pointer);
    
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

//struct Ste_List liner_struct; //定义一个结构体;
typedef struct Ste_List ste_list; //定义创建“结构体”的快捷方式;
typedef struct Ste_List *ste_list_pointer; //创建指向结构体指针的快捷方式;

#pragma mark- 线性表初始化

ste_list_pointer  initLineList() {
    ste_list_pointer ste_list;
    ste_list = malloc(sizeof(ste_list));
//    ste_list->data = {0.0,0.0,0.0,0.0,0.0};
    ste_list->last = -1; //初始化为-1
    return ste_list;
    /*
    另一种形式的初始化方法
    List* my_list;
    my_list = malloc(sizeof(List));
    my_list->last = -1;
     */
 
}
//0x00006000000048b0

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
int findIndex(ste_list_pointer list,int value) {
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
bool insertAtLast(ste_list_pointer list,int value) {
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
bool insertAtIndex(ste_list_pointer list,int value,int index) {
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
void deleteByValue(ste_list_pointer list,int value) {
    int deleteValueCounter = 0;
    int deleteValueIndexArray[MAXCOUNT] = {0};
    for (int i = 0; i <= list->last; i++) {
        if (list->data[i] == value) {
            list->data[i] = 0;
            deleteValueIndexArray[deleteValueCounter] = i - deleteValueCounter; //每添加一个下标，操作步骤少deleteValueCounter
            deleteValueCounter++;
        }
    }
    for (int index = 0 ; index < deleteValueCounter ; index++) {
        for (int j = deleteValueIndexArray[index]; j < list->last; j++) {
            list->data[j] = list->data[j+1];
            list->data[j+1] = 0; //清零
        }
    }
    list->last -= deleteValueCounter; //更新指针;
    //时间复杂度O(n的平方)
    // 可以先找到Value对应的index, 然后根据各个index进行相应的删除操作;
}

#pragma mark- 删除操作--根据Index
bool deleteByIndex(ste_list_pointer list,int index) {
    if (list->last >= index && index >=0 ) {
        for (int i = index; i < list->last; i++) {
            list->data[i] = list->data[i+1];
        }
        list->data[list->last] = 0;
        list->last--;
        return true;
    }else{
        return false;
    }
}

#pragma mark- 遍历所有元素
void enumAllItems(ste_list_pointer list) {
    for (int i = 0 ; i <= list->last; i++) {
        printf("value: %d\n",list->data[i]);
    }
}

@end
