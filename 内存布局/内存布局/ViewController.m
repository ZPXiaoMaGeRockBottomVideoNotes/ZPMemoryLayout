//
//  ViewController.m
//  内存布局
//
//  Created by 赵鹏 on 2019/8/15.
//  Copyright © 2019 赵鹏. All rights reserved.
//

/**
 内存布局：
 内存地址由低到高依次为：
 1、保留段：这块区域一般不放任何东西，是给系统保留的；
 2、代码段(__TEXT)：这块区域一般用来存放编译之后的代码(010101......之类的二进制代码)；
 3、数据段(__DATA)：这块区域一般会按由低地址到高地址的顺序存放如下的内容：
 （1）字符串常量：比如NSString *str = @"123"；
 （2）已初始化的数据：已初始化的全局变量、静态变量等；
 （3）未初始化的数据：未初始化的全局变量、静态变量等。
 4、堆：通过alloc、malloc、calloc等方法动态分配的内存空间。在分配内存地址的时候一般是按照内存地址由小到大的原则进行分配的；
 5、栈：这块区域一般用来存放程序中的局部变量。在存放的时候一般是按照内存地址由大到小的原则进行存放的，即把先遇到的局部变量存放为大的内存地址，后遇到的局部变量存放为小的内存地址；
 6、内核区。
 
 Tagged Pointer：
 ·从64bit开始，iOS引入了Tagged Pointer技术，用于优化NSNumber、NSDate、NSString等小对象的存储；
 在没有使用Tagged Pointer之前，NSNumber等对象需要动态分配内存、维护引用计数等，NSNumber指针存储的是堆中NSNumber对象的地址值；
 ·使用Tagged Pointer之后，NSNumber指针里面存储的数据变成了：Tag（标记） + Data，也就是将数据直接存储在了指针中；
 ·当指针不够存储数据时，才会使用动态分配内存的方式来存储数据；
 ·objc_msgSend能识别Tagged Pointer，比如"objc_msgSend(number, @selector(intValue));"，objc_msgSend函数会直接从指针提取数据，节省了以前的调用开销。
 */
#import "ViewController.h"
#include <objc/message.h>

int a = 10;  //已初始化的全局变量

int c;  //未初始化的全局变量

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    static int b = 20;  //已初始化的静态变量
    
    static int d;  //未初始化的静态变量
}


@end
