//
//  UIColor+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HJExtension)

/**
 *  返回颜色按照色彩的RGB 16进度的值
 *
 *  @param hexString 色码的16进度值
 *  @param alpha   透明度
 *
 *  @return 颜色
 */
+ (UIColor*)hj_colorWithHexString:(NSString *)hexString alpha:(float)alpha;

@end
