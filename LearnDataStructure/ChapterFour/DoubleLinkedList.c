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
void double_link_add_node(link_node_p link_p,int value) {
    if (link_p == NULL) return;
    while (link_p->next != NULL) {
        link_p = link_p->next;
    } //找到最后一个
    link_node_p new_list_point = malloc(sizeof(struct Link_node));
    new_list_point->value = value;
    new_list_point->next = NULL;
    new_list_point->pre = link_p;
    link_p->next = new_list_point;
}

//插入节点
void double_link_insert_node(link_node_p ori_link_p,int index,int value) {
    if (ori_link_p == NULL) return;
    link_node_p cur_p = double_link_search_node(ori_link_p, index);
    if (cur_p == NULL) return;
    link_node_p new_list_point = malloc(sizeof(struct Link_node));
    new_list_point->value = value;
    new_list_point->next = cur_p;
    if (cur_p->pre) {
        new_list_point->pre = cur_p->pre;
        cur_p->pre->next = new_list_point;
    }//必须在处理前驱之前进行赋值;不然值会被覆盖
    cur_p->pre = new_list_point;
}

//通过下标查找节点
link_node_p double_link_search_node(link_node_p link_p,int index) {
    if(index < 1) return NULL;
    int counter = 1;
    while (link_p != NULL && counter != index) {
        counter++;
        link_p = link_p->next;
    }
    return index == counter ? link_p : NULL ;
}

//通过下标删除节点
link_node_p double_link_delete_node(link_node_p ori_p,int index) {
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

//打印各个节点名
void print_double_link_node(link_node_p point) {
    int couter = 1;
    while (point != NULL) {
        printf("node index :%d value:%d\n",couter,point->value);
        point = point->next;
        couter++;
    }
}
//释放链表
void free_double_link_node(link_node_p point) {
    link_node_p tem = point;
    link_node_p next = point;
    while (tem != NULL) {
        next = tem->next;
        free(tem);
        tem = next;
    }
}


