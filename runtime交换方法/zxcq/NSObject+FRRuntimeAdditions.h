//
//  NSObject+FRRuntimeAdditions.h
//  ACC
//
//  Created by wendy on 15/9/24.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (FRRuntimeAdditions)

+ (void)swizzleInstanceMethod:(SEL)originalSEL with:(SEL)replacementSEL;
+ (void)swizzleClassMethod:(SEL)originalSEL with:(SEL)replacementSEL;

@end
