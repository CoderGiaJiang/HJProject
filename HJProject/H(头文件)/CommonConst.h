//
//  CommonConst.h
//  HJProject
//
//  Created by User on 2016/11/1.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>

//宏的用法： 一般字符串抽成宏，代码抽成宏使用。
//const用法：一般常用的字符串定义成const（对于常量字符串苹果推荐我们使用const）。
//宏与const区别：
//1.编译时刻不同，宏属于预编译 ，const属于编译时刻
//2.宏能定义代码，const不能，多个宏对于编译会相对时间较长，影响开发效率，调试过慢，const只会编译一次，缩短编译时间。
//3.宏不会检查错误，const会检查错误


@interface CommonConst : NSObject

UIKIT_EXTERN NSString* const STATUS_COMPANY_ARRAY;
UIKIT_EXTERN NSString* const STATUS_PERSONAL_ARRAY;
UIKIT_EXTERN NSString* const SLECTED_TABBAR_PERSONAL_NOTIFICATION;
UIKIT_EXTERN NSString* const UD_DEVICE_TOKEN;
UIKIT_EXTERN NSString* const GETUI_CID;
UIKIT_EXTERN NSString* const USERNAME;
UIKIT_EXTERN NSString* const SERVERURL;

UIKIT_EXTERN NSString *const YEAY_MONTH_DAY_HOUR_MIN_SEC;
UIKIT_EXTERN NSString *const YEAY_MONTH_DAY_HOUR_MIN;
UIKIT_EXTERN NSString *const YEAY_MONTH_DAY;

UIKIT_EXTERN NSString *const CODE_SUCCESS;
UIKIT_EXTERN NSString *const CODE_NODATA;

@end
