//
//  HJTabBarController.h
//  HJProject
//
//  Created by User on 16/10/11.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJTabBarController : UITabBarController

// 单例
+ (HJTabBarController *)shareInstance;

/**
 *  添加一个新的子控制器
 *
 *  @param viewController            子控制器
 *  @param title                     标题
 *  @param image                     图标
 *  @param selectedImage             选中的图标
 */
- (void)hj_addOneChildViewController:(UIViewController *)viewController
                               title:(NSString *)title
                               image:(NSString *)image
                       selectedImage:(NSString *)selectedImage;

@end
