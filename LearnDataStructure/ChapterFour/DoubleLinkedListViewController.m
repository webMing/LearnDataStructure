//
//  DoubleLinkedListViewController.m
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/28.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "DoubleLinkedListViewController.h"

/*双链表*/

struct Link_node {
    int value;
    struct Link_node *pre;
    struct Link_node *next;
}Link_node;
typedef struct Link_node* link_node_p;

@interface DoubleLinkedListViewController ()

@end

@implementation DoubleLinkedListViewController

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
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

//单链表初始化
link_node_p init_Link_node(int value){
    link_node_p link_point  = malloc(sizeof(Link_node));
    link_point->pre = NULL;
    link_point->next = NULL;
    link_point->value = value;
    return link_point;
}

// 链表元素个数
int link_list_cout(link_node_p link_p) {
    int count = 0;
    link_node_p tem = link_p;
    while (tem != NULL) {
        count++;
        tem = tem->next;
    }
    return count;
}

//链表结尾添加节点
void addNode(link_node_p ori_link_p,int value) {
    link_node_p new_list_point = malloc(sizeof(Link_node));
    new_list_point->value = value;
    new_list_point->next = NULL;
    new_list_point->pre = ori_link_p;
    ori_link_p->next = new_list_point;
}

//通过下标查找链表节点
link_node_p searchNode(link_node_p link_p,int index) {
    if(index < 1) return NULL;
    int counter = 1;
    while (link_p != NULL && counter != index) {
        counter++;
        link_p = link_p->next;
    }
    return index == counter ? link_p : NULL ;
}

/*

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
*/

@end
