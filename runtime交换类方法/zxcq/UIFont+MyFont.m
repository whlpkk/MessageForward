//
//  UIFont+MyFont.m
//  ACC
//
//  Created by wendy on 15/9/24.
//  Copyright (c) 2015年 wendy. All rights reserved.
//

#import "UIFont+MyFont.h"
#import "NSObject+FRRuntimeAdditions.h"
@implementation UIFont (MyFont)

+ (UIFont *)MboldSystemFontOfSize:(CGFloat)size
{
    return [[self class] MboldSystemFontOfSize:10];
}

+ (void)load
{
    [self swizzleClassMethod:@selector(boldSystemFontOfSize:)
                        with:@selector(MboldSystemFontOfSize:)];
}

@end
