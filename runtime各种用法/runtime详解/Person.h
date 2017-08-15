//
//  Person.h
//  runtime详解
//
//  Created by iyaqi on 16/1/26.
//  Copyright © 2016年 iyaqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(copy,nonatomic)NSString *name;
@property(assign,nonatomic)NSInteger age;

//在.m文件中添加了@dynamic，所以下面的属性不会自动添加setter和getter方法
@property(assign,nonatomic)NSInteger weight;
@property(copy,nonatomic)NSString *identifier;
@property(copy,nonatomic)NSString *doesNotRecognize;

@end

