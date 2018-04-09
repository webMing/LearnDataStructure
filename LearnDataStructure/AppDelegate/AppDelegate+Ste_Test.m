//
//  AppDelegate+Ste_Test.m
//  LearnDataStructure
//
//  Created by Stephanie on 2018/4/3.
//Copyright © 2018年 Stephanie. All rights reserved.
//

#import "AppDelegate+Ste_Test.h"
#import "Macro.h"
#import <objc/runtime.h>
#import <TargetConditionals.h>

#if TARGET_OS_IPHONE
    #define STE_IPHONE_FLAG 1
#elif TARGET_OS_OSX
    #define STE_IPHONE_FLAG 0;
#endif

@implementation AppDelegate (Ste_Test)

- (void)test_macro {
    
    /*
    int __a = 1;
    int __b = 2;
    printf("Macro:%d \n", STMIN(__a,__b));
    printf("Macro:%d\n",__COUNTER__);
    MIN(1, 1);
    
//    if (YES) STE_CC(4)
    STLOG(@"%@__%@",@"AA好的👌",@"回家");
    unsigned char a = 0xfff00;
    unsigned char b = 0x100;
    signed char ff = a & b;
    BOOL yesOrNo = a&b;
    if (yesOrNo) {
        printf("this just ok");
    }

    int c = ({int a = 1; b = 2; a + b; });
    
    printf("%d",__COUNTER__);
    printf("%d",__COUNTER__);
    printf("%d",__COUNTER__);
    
    int te_var = 1;
    int te_reult =  FOO(te_var) == 2 ? FOO(te_var) : 2;
    */
    
    /*
    int auto_add = 1;
    if(YES)
        FOO1(auto_add)
    else
        // do somthing;
     */
        
}
@end
