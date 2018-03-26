//
//  LinkedListViewController.m
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/25.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "LinkedListViewController.h"

struct Link_list {
    int value;
    void* next;
};
typedef struct Link_list link_list;
typedef struct Link_list *link_list_point;

@interface LinkedListViewController ()

@end

@implementation LinkedListViewController

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
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

//单链表初始化
link_list_point initLinkedList(){
    link_list_point link_point  = malloc(sizeof(link_list));
    link_point->value = 1;
    return link_point;
}
// 链表元素个数
int link_list_cout(link_list_point link_point) {
    if (link_point == NULL) return 0;
    int count = 0;
    link_list_point tem = link_point;
    do {
        count++;
        tem = tem->next;
    } while (tem->next != NULL);
    return count;
}
//通过下标查找链表节点
link_list_point searchNode(link_list_point link_point,int index) {
    if (index == 1) return link_point;
    link_list_point search_link_point = link_point;
    int counter = 1;
    while (search_link_point->next != NULL) {
        search_link_point = search_link_point->next;
        counter++;
        if (counter == index) {
            break;
        }
    }
    return search_link_point == link_point ? NULL : search_link_point;

}
//添加链表节点
void addNode(link_list_point ori_link_point,int value) {
    link_list_point new_list_point = malloc(sizeof(link_list));
    new_list_point->value = value;
    new_list_point->next = NULL;
    ori_link_point->next = new_list_point;
}
//通过下标删除链表节点(1 ....)
bool deleteNode(link_list_point ori_link_point,int index) {
    //case : index ==1
    if (index == 1) {
        link_list_point tem = ori_link_point->next;
        free(ori_link_point);
        ori_link_point = tem;
        return true;
    }
    //case : index !=1
    //index-1链表指针;
    link_list_point pre_link_node = searchNode(ori_link_point,index-1);
    //index链表指针
    link_list_point link_node = pre_link_node->next;
    if (link_node == NULL) return true ; //越界
    //链接
    pre_link_node->next = link_node->next;
    free(link_node);
    return true;
}
@end
