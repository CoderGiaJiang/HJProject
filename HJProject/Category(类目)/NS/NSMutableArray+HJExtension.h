//
//  NSMutableArray+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (HJExtension)

/**
 获取数组中索引对应的元素(防止数组越界)
 
 @param index 索引
 
 @return 数组内容
 */
- (id)hj_objectAtIndexCheck:(NSUInteger)index;

@end
