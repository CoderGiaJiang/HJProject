//
//  UIColor+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "UIColor+HJExtension.h"

@implementation UIColor (HJExtension)

/**
 *  返回颜色按照色彩的RGB 16进度的值
 *
 *  @param hexString  色码的16进度值
 *  @param alpha   透明度
 *
 *  @return 颜色
 */
+ (UIColor*)hj_colorWithHexString:(NSString *)hexString alpha:(float)alpha
{
    
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // 字符串应该是6或8个字符 如果不是返回没有颜色
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 如果出现带 0X
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    // 如果出现带 #
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 分离成r、g、b子字符串
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // 扫描值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
    
}


@end
