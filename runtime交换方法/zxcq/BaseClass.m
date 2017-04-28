//
//  BaseClass.m
//  zxcq
//
//  Created by kun on 15/9/24.
//  Copyright © 2015年 tuan800. All rights reserved.
//

#import "BaseClass.h"
#import <objc/runtime.h>
#import "NSObject+FRRuntimeAdditions.h"

@implementation BaseClass

- (void)baseVersionMethod {
    NSLog(@"baseVersionMethod has been called.");
}

@end

@implementation SubClass

@end

@implementation SubClass (MySubClass)

- (void)baseVersionMethod {
    [super baseVersionMethod];
}

- (void)myMethod {
    NSLog(@"myMethod");
    [self myMethod];
}

+ (void)load {
    [self swizzleInstanceMethod:@selector(baseVersionMethod)
                           with:@selector(myMethod)];
}

@end