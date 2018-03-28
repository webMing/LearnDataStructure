//
//  LinkedList.h
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/28.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#ifndef LinkedList_h
#define LinkedList_h
#include <stdlib.h>
#include <stdio.h>
struct Link_list {
    int value;
    void* next;
};
typedef struct Link_list link_list;
typedef struct Link_list *link_list_point;

//单链表初始化
link_list_point init_Link_node(int value);

// 链表元素个数
int link_list_cout(link_list_point link_point);

//添加链表节点
link_list_point addNode(link_list_point ori_link_point,int value);

//通过下标查找链表节点
link_list_point searchNode(link_list_point link_point,int index);

//通过下标删除链表节点(1 ....)
link_list_point deleteNode(link_list_point ori_link_point,int index);

// print fuc
void printNodeValue(link_list_point point);

#endif /* LinkedList_h */
