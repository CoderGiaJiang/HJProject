//
//  NSDate+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HJExtension)

/**
 *  判断某个时间是否为今年
 *
 *  @return BOOL 结果返回
 */
- (BOOL)hj_judgeWhetherOrNotIsThisYear;

/**
 *  判断某个时间是否为昨天
 *
 *  @return BOOL 结果返回
 */
- (BOOL)hj_judgeWhetherOrNotIsYesterday;

/**
 *  判断某个时间是否为今天
 *
 *  @return BOOL 结果返回
 */
- (BOOL)hj_judgeWhetherOrNotIsToday;

@end
