//
//  NSArray+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "NSArray+HJExtension.h"

@implementation NSArray (HJExtension)

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


/**
 ASCII 升序排序
 
 @return 排序后的数组
 */
- (NSArray *)hj_sortedArrayBaseASCIIAscending
{
    NSArray *sortedArray = [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2] == NSOrderedAscending;
    }];
    
    NSArray* newArray = [[sortedArray reverseObjectEnumerator] allObjects];
    return newArray;
}

/**
 ASCII 降序排序
 
 @return 排序后的数组
 */
- (NSArray *)hj_sortedArrayBaseASCIIDescending
{
    NSArray *sortedArray = [self sortedArrayUsingComparator:^(id obj1, id obj2){
        return [obj1 compare:obj2];
    }];
    
    NSArray* newArray = [[sortedArray reverseObjectEnumerator] allObjects];
    return newArray;
}

/**
 深拷贝
 
 @return 深拷贝后的数组
 */
- (NSMutableArray *)hj_mutableDeepCopy
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] initWithCapacity:self.count];
    
    for(id oneValue in self) {
        id oneCopy = nil;
        
        if([oneValue respondsToSelector:@selector(hj_mutableDeepCopy)]) {
            oneCopy = [oneValue hj_mutableDeepCopy];
        } else if([oneValue conformsToProtocol:@protocol(NSMutableCopying)]) {
            oneCopy = [oneValue mutableCopy];
        } else if([oneValue conformsToProtocol:@protocol(NSCopying)]){
            oneCopy = [oneValue copy];
        } else {
            oneCopy = oneValue;
        }
        
        [returnArray addObject:oneCopy];
    }
    
    return returnArray;
}

/**
 新建含有n个空字符串的数组
 
 @param count 数组元素个数
 
 @return 不可变数组
 */
+ (NSMutableArray *)hj_arrayContainEmptyStringWithCount:(NSInteger)count{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        [arr addObject:@""];
    }
    return arr;
}


@end
