//
//  LinkedListViewController.m
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/25.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "LinkedListViewController.h"
#import "LinkedList.h"


@interface LinkedListViewController ()

@end

@implementation LinkedListViewController

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
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
    node1 = deleteNode(node1,6);
    printNodeValue(node1); //注意这里压入栈中的值是:"之前node1的值"
}

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod


@end
