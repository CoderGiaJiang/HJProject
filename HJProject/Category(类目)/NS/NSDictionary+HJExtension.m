//
//  NSDictionary+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "NSDictionary+HJExtension.h"

@implementation NSDictionary (HJExtension)

/**
 深拷贝
 
 @return 深拷贝后的字典
 */
- (NSMutableDictionary *)hj_mutableDeepCopy
{
    NSMutableDictionary *returnDict = [[NSMutableDictionary alloc] initWithCapacity:self.count];
    
    NSArray *keys = [self allKeys];
    
    for(id key in keys) {
        id oneValue = [self objectForKey:key];
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
        
        [returnDict setValue:oneCopy forKey:key];
    }
    
    return returnDict;
}


/**
 自定义字典转字符串方法
 
 @return 不可变字符串
 */
- (NSMutableString*)hj_dictionaryToString;
{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding].mutableCopy;
}


@end
