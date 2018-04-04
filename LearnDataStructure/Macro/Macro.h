//
//  Macro.h
//  LearnDataStructure
//
//  Created by Stephanie on 2018/4/3.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

//定义最小值
#define MAX_SIZE 30

//宏体换行,最后添加反斜杠(\)
#define NUMS 1,\
             2

/*
 返回最小值
 A = 3
 B = 4 < 5 ? 5:4
 MIN(1,4<5) (4)>(4<5?5"4)?(4):(4<5?5:4)
 宏的嵌套没有问题MIN(2,MIN(3,4)) ==>>>> ( (2)>(MIN(3,4))?(MIN(3,4)):(2))
 
 */

#ifndef MIN////(A,X)
#define MIN(A,X) ((A)>(X)?(A):(X))
#endif

//如果宏参数前加个#，那么在宏体扩展的时候，宏参数会被扩展成字符串的形式
//使用的时候后面不需要添加; eg: WARN_IF(0<3); 后面的分号是多余的

#define WARN_IF(EXP) { \
    if(EXP) \
    printf("Printf Content: "#EXP" \n"); /*注意这里使用双引号"#EXP"*/  \
}

//(链接) “##”是一种分隔连接方式，它的作用是先分隔，然后进行强制连接
#define TYPE(TYPE,NAME) TYPE NAME_TYPE_TYPE  //NAME_TYPE_TYPE 链接在一起没有被替换
#define TYPE1(TYPE,NAME) TYPE NAME TYPE TYPE  //使用的时候直接发生错误
#define TYPE2(TYPE,NAME) TYPE NAME##_##TYPE##_##TYPE //正确方式

//GNUC MIN
#define STMIN(A,B)    ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a < __b ? __a : __b; })


#define STE_CC(V) { printf("\n"); printf("V:%d \n",V); }
#endif /* Macro_h */
