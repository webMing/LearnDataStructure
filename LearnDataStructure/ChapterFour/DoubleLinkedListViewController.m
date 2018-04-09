//
//  DoubleLinkedListViewController.m
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/28.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#import "DoubleLinkedListViewController.h"
#include "DoubleLinkedList.h"
#import "Macro.h"

@interface DoubleLinkedListViewController ()

@end

@implementation DoubleLinkedListViewController

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //STLOG(@"this is custom world~");
    //STLOG1(@"this is printf world!%@",@"☺T我的世界HOS");
    return;
    link_node_p n1 = double_init_Link_node(1);
    double_link_add_node(n1, 2);
    double_link_add_node(n1, 3);
    double_link_add_node(n1, 4);
    double_link_insert_node(n1, 2, 5);
    
    int search_index = 2;
    link_node_p search_node = double_link_search_node(n1, search_index);
    printf("search node index:%d value:%d\n",search_index,search_node->value);
    
    n1 = double_link_delete_node(n1, 2);
    double_link_add_node(n1, 5);

    print_double_link_node(n1);
    free_double_link_node(n1);
    
    /*
    int q,w,r; q=w=r=0;
    int aa = 0x7FFFFFFF;
    short a = 0x7FFF;
    char b = 0x7F;
    short c = a + b;
    printf("%d",a + b);
     */
    /*
    //unsigned int a = 2147483647*2+1;//4294967295;
    unsigned int b = 2147483647;
     unsigned long c = 18446744073709551414;
    long long f = b + c;
    printf("test code:%lu\n",sizeof(f));
    printf("size of char is %lu bytes \n",sizeof(char));
    printf("size of short is %lu bytes \n",sizeof(short));
    printf("size of int is %lu bytes \n",sizeof(int));
    printf("size of unsigned int is %lu bytes \n",sizeof(unsigned int));
    printf("size of long is %lu bytes \n",sizeof(long));
    printf("size of unsigned long is %lu bytes \n",sizeof(unsigned long));
    printf("size of float is %lu bytes \n",sizeof(float));
    printf("size of double is %lu bytes \n",sizeof(double));
    printf("size of long double is %lu bytes \n",sizeof(long double));
    */
}

#pragma mark- CreateUI

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod


@end
