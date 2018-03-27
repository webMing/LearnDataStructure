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
    int a = 3;
    int b = 4;
    int *p = &a;
    chage_point(p,&b);
    printf("current value:%d\n",*p);
}

void chage_point(int *p,int *b) {
    //*p = *b;
    p = b;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //测试链表统计个数
    link_list_point node1 = init_Link_node(1);
    link_list_point node2 = addNode(node1,2);
    link_list_point node3 = addNode(node2,3);
    link_list_point node4 = addNode(node3,4);
    link_list_point node5 = addNode(node4,5);
    link_list_point node6 = addNode(node5,6);
    //链表个数
    printf("link_list_count:%d\n",link_list_cout(node1));
    //下标查找节点
    int index = 5;
    if (searchNode(node1,index) != NULL) {
        printf("search_node_at_index:%d value:%d\n",index,searchNode(node1,index)->value);
    }
    deleteNode(node1,1);
    
    printNodeValue(node1); //注意这里压入栈中的值是:"之前node1的值"
}

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

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
bool deleteNode(link_list_point ori_link_point,int index) {
    if (index < 1) return false;
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

void printNodeValue(link_list_point point) {
    link_list_point tem = point;
    int couter = 1;
    while (tem != NULL) {
        printf("node index :%d value:%d\n",couter,tem->value);
        tem = tem->next;
        couter++;
    }
}
@end
