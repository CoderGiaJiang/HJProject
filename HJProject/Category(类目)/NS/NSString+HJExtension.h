//
//  NSString+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (HJExtension)

#pragma mark - 字符串处理

/**
 *  获取两个字符串之间的字符串
 *
 *  @param frontStr  前面的字符串
 *  @param behindStr 后面的字符串
 *
 *  @return 中间的字符串
 */
- (NSString *)hj_stringBetweenFrontString:(NSString *)frontStr
                             behindString:(NSString *)behindStr;

/**
 *  删除字符串中的空格
 *
 *  @return 删除空格之后的字符串
 */
- (NSString *)hj_deleteBlankSpaceFromString;

/**
 *  删除首尾空格的字符串
 *
 *  @return 删除首尾空格后的字符串
 */
- (NSString *)hj_deleteBlankFromTheBeginAndEndOfString;

/**
 *  删除首尾指定的字符集
 *
 *  @param str 指定的字符集
 *
 *  @return 删除指定字符集后的字符串
 */
- (NSString *)hj_deleteBeginAndEndToString:(NSString *)str;

/**
 *  删除指定的字符集
 *
 *  @param str 指定的字符集
 *
 *  @return 删除指定字符集后的字符串
 */
- (NSString *)hj_deleteTheSpecifiedCharacterSet:(NSString *)str;

/**
 *  过滤特殊字符串
 *
 *  @return 返回过滤后的字符串
 */
- (NSString *)hj_filterSpecialStrings;

/**
 *  替换掉图片名的后缀 方便更换高清图片
 *
 *  @param suffix 图片后缀名
 *
 *  @return 返回替换的图片名称
 */
- (NSString*)hj_stringByReplaceImageSuffix: (NSString*)suffix;



#pragma mark - MD5
/**
 *  MD5 加密字符串
 *
 *  @return MD5 加密后的字符串
 */
- (NSString *)hj_MD5Encryption;

/**
 *  MD5 加密小写字符串
 *
 *  @return MD5 加密后的小写字符串
 */
- (NSString *)hj_MD5LowerCaseEncryption;

/**
 *  MD5 加密大写字符串
 *
 *  @return MD5 加密后的大写字符串
 */
- (NSString *)hj_MD5UpperCaseEncryption;

#pragma mark - 时间处理

/**
 *  时间字符串转 NSDate
 *
 *  @param dateFormat 时间格式字符串
 *
 *  @return NSDate
 */
- (NSDate *)hj_dateFromStringWithFormat:(NSString *)dateFormat;

/**
 *  获取到的时间戳展现成 分钟前 小时前 天前
 *
 *  @return 返回距离传入时间的时间间隔
 */
- (NSString *)hj_timeStampToTurnBackTime;

/**
 *  获取当前时间
 *
 *  @param dateFormat 传入时间格式
 *
 *  @return 当前时间字符串
 */
+ (NSString *)hj_stringFromNowTimeWithFormat:(NSString *)dateFormat;

/**
 *  时间戳转时间
 *
 *  @param dateFormat 时间格式
 *
 *  @return 时间字符串
 */
- (NSString *)hj_timeStampWithFormat:(NSString *)dateFormat;

/**
 *  时间转时间戳
 *
 *  @param dateFormat 时间格式
 *
 *  @return 时间戳
 */
- (NSInteger)hj_TimeToTimeStampWithFormat:(NSString *)dateFormat;

#pragma mark - 计算尺寸
/**
 *  计算字符串的高度
 *
 *  @param size 限制尺寸
 *  @param font 字体大小
 *
 *  @return 自适应高度
 */
- (CGFloat)hj_caclulateHeightBaseLimitSize:(CGSize)size font:(CGFloat)font;

/**
 *  计算字符串的宽度度
 *
 *  @param size 限制尺寸
 *  @param font 字体大小
 *
 *  @return 自适应宽度
 */
- (CGFloat)hj_caclulateWidthBaseLimitSize:(CGSize)size font:(CGFloat )font;

#pragma mark - 其他
/**
 计算总文件夹所占内存大小

 @return 内存大小
 */
- (unsigned long long)hj_caculateFileSize;

/**
 *  字符串转类
 *
 *  @return 类
 */
- (Class)hj_classFromString;

@end
