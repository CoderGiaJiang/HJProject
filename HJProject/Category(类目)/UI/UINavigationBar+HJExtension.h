//
//  UINavigationBar+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (HJExtension)

/**
 *  找到导航栏的下划线
 *
 *  @return 下划线的imageView
 */
- (UIImageView *)hj_findUnderLineImageView;

/**
 *  设置导航栏字体颜色和文字大小
 *
 *  @param color    字体颜色
 *  @param fontSize 字体大小
 */
- (void)hj_setTitleColor:(UIColor *)color font:(CGFloat)fontSize;

@end
