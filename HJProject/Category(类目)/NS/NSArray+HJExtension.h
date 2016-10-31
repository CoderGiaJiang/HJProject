//
//  NSArray+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HJExtension)


/**
 获取数组中索引对应的元素(防止数组越界)
 
 @param index 索引
 
 @return 数组内容
 */
- (id)hj_objectAtIndexCheck:(NSUInteger)index;

/**
 ASCII 升序排序

 @return 排序后的数组
 */
- (NSArray *)hj_sortedArrayBaseASCIIAscending;

/**
 ASCII 降序排序
 
 @return 排序后的数组
 */
- (NSArray *)hj_sortedArrayBaseASCIIDescending;

/**
 深拷贝

 @return 深拷贝后的数组
 */
- (NSMutableArray *)hj_mutableDeepCopy;

/**
 新建含有n个空字符串的数组

 @param count 数组元素个数

 @return 不可变数组
 */
+ (NSMutableArray *)hj_arrayContainEmptyStringWithCount:(NSInteger)count;

@end
