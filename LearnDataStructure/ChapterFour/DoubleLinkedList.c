//
//  DoubleLinkedList.c
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/28.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#include "DoubleLinkedList.h"

//单链表初始化
link_node_p double_init_Link_node(int value){
    link_node_p link_point  = malloc(sizeof(struct Link_node));
    link_point->pre = NULL;
    link_point->next = NULL;
    link_point->value = value;
    return link_point;
}

// 链表元素个数
int double_link_list_count(link_node_p link_p) {
    int count = 0;
    //link_node_p tem = link_p; 之前的指针压在栈中;所以不需要使用 中间变量
    while (link_p != NULL) {
        count++;
        link_p = link_p->next;
    }
    return count;
}

//链表结尾添加节点
void double_link_addNode_at_end(link_node_p ori_link_p,int value) {
    link_node_p new_list_point = malloc(sizeof(struct Link_node));
    new_list_point->value = value;
    new_list_point->next = NULL;
    new_list_point->pre = ori_link_p;
    ori_link_p->next = new_list_point;
}

//通过下标查找链表节点
link_node_p double_link_search_node(link_node_p link_p,int index) {
    if(index < 1) return NULL;
    int counter = 1;
    while (link_p != NULL && counter != index) {
        counter++;
        link_p = link_p->next;
    }
    return index == counter ? link_p : NULL ;
}

//通过下标删除链表节点(1 ....)
link_node_p double_link_deleteNode(link_node_p ori_p,int index) {
     if (index < 1) return ori_p;
     //case : index ==1
     if (index == 1) {
         link_node_p tem = ori_p->next;
         free(ori_p);
         return tem;
     }
     //case : index !=1
     //index-1链表指针;当使用双链表的时候同pre直接获取前驱
     link_node_p search_node = double_link_search_node(ori_p,index);
     if (search_node == NULL) return ori_p ; //越界
     search_node->pre->next = search_node->next;
     free(search_node);
     return ori_p;
 }

void print_double_link_node(link_node_p point) {
    int couter = 1;
    while (point != NULL) {
        printf("node index :%d value:%d\n",couter,point->value);
        point = point->next;
        couter++;
    }
}

void free_double_link_node(link_node_p point) {
    link_node_p tem = point;
    link_node_p next = point;
    while (tem != NULL) {
        next = tem->next;
        free(tem);
        tem = next;
    }
}


