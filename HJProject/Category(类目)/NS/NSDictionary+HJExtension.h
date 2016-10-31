//
//  NSDictionary+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HJExtension)

/**
 深拷贝

 @return 深拷贝后的字典
 */
- (NSMutableDictionary *)hj_mutableDeepCopy;

/**
 自定义字典转字符串方法

 @return 不可变字符串
 */
- (NSMutableString*)hj_dictionaryToString;


@end
