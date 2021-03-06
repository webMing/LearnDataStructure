//
//  LinkedList.c
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/28.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#include "LinkedList.h"

//单链表初始化
link_list_point init_Link_node(int value){
    link_list_point link_point  = malloc(sizeof(link_list));
    link_point->value = value;
    link_point->next = NULL;
    return link_point;
}
// 链表元素个数
int link_list_cout(link_list_point link_point) {
    int count = 0;
    link_list_point tem = link_point;
    while (tem != NULL) {
        count++;
        tem = tem->next;
    }
    return count;
}

//添加链表节点
link_list_point addNode(link_list_point ori_link_point,int value) {
    link_list_point new_list_point = malloc(sizeof(link_list));
    new_list_point->value = value;
    new_list_point->next = NULL;
    ori_link_point->next = new_list_point;
    return new_list_point;
}

//通过下标查找链表节点
link_list_point searchNode(link_list_point link_point,int index) {
    link_list_point search_link_point = link_point;
    int counter = 1;
    while (search_link_point != NULL) {
        if (counter == index) {
            break;
        }
        counter++;
        search_link_point = search_link_point->next;
    }
    return index == counter ? search_link_point : NULL ;
}

//通过下标删除链表节点(1 ....)
link_list_point deleteNode(link_list_point ori_link_point,int index) {
    if (index < 1) return ori_link_point;
    //case : index ==1
    if (index == 1) {
        link_list_point tem = ori_link_point->next;
        free(ori_link_point);
        return tem;
    }
    //case : index !=1
    //index-1链表指针;
    link_list_point pre_link_node = searchNode(ori_link_point,index-1);
    //index链表指针
    link_list_point link_node = pre_link_node->next;
    if (link_node == NULL) return ori_link_point ; //越界
    //链接
    pre_link_node->next = link_node->next;
    free(link_node);
    return ori_link_point;
}

void printNodeValue(link_list_point point) {
    link_list_point tem = point;
    int couter = 1;
    while (tem != NULL) {
        printf("node index :%d value:%d\n",couter,tem->value);
        tem = tem->next;
        couter++;
    }
}
