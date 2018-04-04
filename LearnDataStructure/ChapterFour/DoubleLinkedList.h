//
//  DoubleLinkedList.h
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/28.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#ifndef DoubleLinkedList_h
#define DoubleLinkedList_h

#include <stdio.h>
#include <stdlib.h>

/*双链表*/
struct Link_node {
    int value;
    struct Link_node *pre;
    struct Link_node *next;
};

typedef struct Link_node* link_node_p;

#warning 如果直接写 int a 会报错;\
改成 extern int a 就可以了 \
.h（头文件）不允许定义变量 \
static int a 的确可以避免符号冲突,但是会在引用它的每一源文件中创建一个独立的变量a
//extern int a ;

// 单链表初始化
extern link_node_p double_init_Link_node(int value);

// 链表元素个数
extern int double_link_list_count(link_node_p link_p);

// 链表结尾添加节点
extern void double_link_add_node(link_node_p ori_link_p,int value);

// 插入节点
extern void double_link_insert_node(link_node_p ori_link_p,int index,int value);

// 通过下标查找链表节点
extern link_node_p double_link_search_node(link_node_p link_p,int index);

// 通过下标删除链表节点(1 ....)
link_node_p double_link_delete_node(link_node_p ori_p,int index);

// 打印各个节点值
extern void print_double_link_node(link_node_p point);

// 释放节点所占的内存
extern void free_double_link_node(link_node_p point);

#endif /* DoubleLinkedList_h */
