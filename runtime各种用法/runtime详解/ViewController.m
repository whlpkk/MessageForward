//
//  ViewController.m
//  runtime详解
//
//  Created by iyaqi on 16/1/19.
//  Copyright © 2016年 iyaqi. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 *  获取属性列表
 */
- (IBAction)getProperties{
    //通过这个方法获取类
    id personClass = objc_getClass("Person");
    
    unsigned int outCount;
    //通过下面的方法获取属性列表
    objc_property_t *properties = class_copyPropertyList(personClass, &outCount);
    
    for (int i = 0 ; i < outCount; i++) {
        objc_property_t property = properties[i];
        printf("%s:%s\n",property_getName(property),property_getAttributes(property));
        //打印结果
        //name:T@"NSString",C,N,V_name
        //age:Tq,N,V_age
    }
    free(properties);
}


/**
 *  动态方法解析
 */
- (IBAction)dynamicMethodSolution{
    Person *person = [[Person alloc]init] ;
    person.weight = 100;//This is a dynamic method added for Person instance
}

/**
 *  重定向
 */
- (IBAction)redirect{
    Person *person = [[Person alloc]init] ;
    NSInteger weightValue = person.weight;
    NSLog(@"%ld",weightValue); //666
}

/**
 *  转发
 */
- (IBAction)forward{
    Person *person = [[Person alloc] init];
    person.identifier = @"yzk whlpkk";
    NSLog(@"%@",person.identifier); //null
}

/**
 *  获取IMP指针地址并调用
 */
- (IBAction)getIMPPointer{
    //定义一个IMP
    void (*methodPointer1)(id ,SEL);
    
    //methodForSelector根据@selector返回IMP指针地址
    methodPointer1 = (void (*)(id, SEL))[Person methodForSelector:@selector(description)];
    //执行这个IMP
    methodPointer1([Person class],@selector(description));//person have name and age property
    
    Person *person = [[Person alloc]init] ;
    void (*methodPointer2)(id ,SEL,BOOL);
    methodPointer2 = (void (*)(id,SEL,BOOL))[person methodForSelector:@selector(isTest:)];
    methodPointer2(person,@selector(isTest:),YES);//This is a test method
}

/**
 *  不识别的方法
 */
- (IBAction)doesNotRecognize{
    Person *person = [[Person alloc]init] ;
    person.doesNotRecognize = @"123";
}


@end
