//
//  UINavigationBar+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "UINavigationBar+HJExtension.h"

@implementation UINavigationBar (HJExtension)

/**
 *  找到导航栏的下划线
 *
 *  @return 下划线的imageView
 */
- (UIImageView *)hj_findUnderLineImageView
{
    return [self hj_findUnderLineImageView:self];
}

- (UIImageView *)hj_findUnderLineImageView:(UIView *)view{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self hj_findUnderLineImageView:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


/**
 *  设置导航栏字体颜色和文字大小
 *
 *  @param color    字体颜色
 *  @param fontSize 字体大小
 */
- (void)hj_setTitleColor:(UIColor *)color font:(CGFloat)fontSize;
{
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:fontSize],NSFontAttributeName,nil];
    self.titleTextAttributes = dict;
}

@end
