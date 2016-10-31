//
//  UIBarButtonItem+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HJExtension)

/**
 *  创建一个 UIBarButtonItem
 *
 *  @param image     默认图片
 *  @param highImage 高亮状态的图片
 *  @param handle    按钮点击回调
 *
 *  @return UIBarButtonItem 对象
 */
+ (instancetype)hj_itemWithImage:(NSString *)image
                       highImage:(NSString *)highImage
                          handle:(HJButtonBlock)handle;

/**
 *  创建一个只含有标题的UIBarButtonItem
 *
 *  @param title  标题
 *  @param handle 点击回调
 *
 *  @return UIBarItem
 */
+ (instancetype)hj_itemWithTitle:(NSString *)title handle:(HJBarBtnBlock)handle;

/**
 *  创建一个只含有图片的UIBarButtonItem
 *
 *  @param image  图片
 *  @param handle 点击回调
 *
 *  @return UIBarItem
 */
+ (instancetype)hj_itemWithImage:(UIImage *)image handle:(HJBarBtnBlock)handle;

@end
