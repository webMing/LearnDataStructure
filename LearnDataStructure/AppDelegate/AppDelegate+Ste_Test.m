//
//  AppDelegate+Ste_Test.m
//  LearnDataStructure
//
//  Created by Stephanie on 2018/4/3.
//Copyright © 2018年 Stephanie. All rights reserved.
//

#import "AppDelegate+Ste_Test.h"
#import "Macro.h"

@implementation AppDelegate (Ste_Test)
- (void)test_macro {
    int __a = 1;
    int __b = 2;
    printf("Macro:%d \n", STMIN(__a,__b));
    printf("Macro:%d\n",__COUNTER__);
    MIN(1, 1);
    
    if (YES) STE_CC(4)
    

    
}
@end
