//
//  Person.m
//  runtime详解
//
//  Created by iyaqi on 16/1/26.
//  Copyright © 2016年 iyaqi. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import "People.h"

@implementation Person

@dynamic weight;
@dynamic identifier;
@dynamic doesNotRecognize;

- (void)isTest:(BOOL)yes{
    if (yes) {
        NSLog(@"This is a test method");
    }else{
        NSLog(@"This is not a test method");
    }
}

+ (NSString *)description
{
    NSLog(@"person have name and age property");
    return @"description";
}

void setPropertyDynamic(id self,SEL _cmd, int weight){
    NSLog(@"This is a dynamic method added for Person instance : %d", weight);
}

// type encode https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(setWeight:)){
        class_addMethod([self class], sel,(IMP)setPropertyDynamic, "v@:i");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(weight)) {
        People *people = [People new];
        return people;
    }
    id target = [super forwardingTargetForSelector:aSelector];
    return target;
}




- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(setIdentifier:) || aSelector == @selector(identifier) ) {
        NSMethodSignature *sign = [People instanceMethodSignatureForSelector:aSelector];
        return sign;
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    People *people = [[People alloc]init];
    if ([people respondsToSelector:[anInvocation selector]]) {
        
        [anInvocation invokeWithTarget:people];
    }else{
        [super forwardInvocation:anInvocation];
    }
}




- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([super respondsToSelector:aSelector]) {
        
        return YES;
    }else{
        /* Here, test whether the aSelector message can     *
         * be forwarded to another object and whether that  *
         * object can respond to it. Return YES if it can.  */
    }
    return NO;
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"-------------------\ndoesNotRecognizeSelector: %@\n-------------------",NSStringFromSelector(aSelector));
    return [super doesNotRecognizeSelector:aSelector];
}

@end

