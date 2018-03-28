//
//  linkedCommon.h
//  LearnDataStructure
//
//  Created by Stephanie on 2018/3/28.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

/*
 之前的想法是把 打印函数链表的函数、初始化函数、内存释放函数 抽离出来；
 因为之前的代码已经写好，为了对比之前的代码 并没有修改;
 */
#ifndef linkedCommon_h
#define linkedCommon_h

#include <stdio.h>
struct com_stuc_{
    int value;
    void* next;
};
typedef struct com_stuc_ *com_stuc;
#endif /* linkedCommon_h */
