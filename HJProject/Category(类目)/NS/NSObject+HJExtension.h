//
//  NSObject+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HJExtension)

/**
 对系统方法进行替换

 @param originalSelector 想要替换的方法
 @param swizzledSelector 实际替换为的方法
 @param error            替换过程中出现的错误，如果没有错误为nil

 @return 是否转换成功 (布尔类型)
 */
+ (BOOL)hj_swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error;


@end
