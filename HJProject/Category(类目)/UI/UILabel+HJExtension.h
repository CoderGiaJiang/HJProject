//
//  UILabel+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HJExtension)

/**
 *  创建一个文字在中心的 UILabel
 *
 *  @param frame    在父视图的 Rect
 *  @param text     文字
 *  @param color    文字颜色
 *  @param fontSize 字体大小
 *
 *  @return UILabel
 */
+ (instancetype)hj_labelWithTextCenterWithFrame:(CGRect)frame
                                           text:(NSString *)text
                                      textColor:(UIColor *)color
                                           font:(CGFloat)fontSize;
/**
 *  创建一个文字在靠左的 UILabel
 *
 *  @param frame    在父视图的 Rect
 *  @param text     文字
 *  @param color    文字颜色
 *  @param fontSize 字体大小
 *
 *  @return UILabel
 */
+ (instancetype)hj_labelWithFrame:(CGRect)frame
                             text:(NSString *)text
                        textColor:(UIColor *)color
                             font:(CGFloat)fontSize;

@end
