//
//  NSMutableArray+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "NSMutableArray+HJExtension.h"

@implementation NSMutableArray (HJExtension)

/**
 获取数组中索引对应的元素(防止数组越界)
 
 @param index 索引
 
 @return 数组内容
 */
- (id)hj_objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

@end
