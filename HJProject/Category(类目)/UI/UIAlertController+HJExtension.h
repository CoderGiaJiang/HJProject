//
//  UIAlertController+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (HJExtension)

/**
 *  推出AlertStyle的提示框
 *
 *  @param message    提示信息
 *  @param vc         视图控制器
 *  @param completion 点击确定回调
 *
 *  @return UIAlertController
 */
+ (instancetype)hj_showAlertStyleTipWithVC:(UIViewController *)vc
                                   message:(NSString *)message
                                completion:(HJCompletionBlcok)completion;

/**
 *  推出AlertStyle的提示框(确认，取消)
 *
 *  @param vc         视图控制器
 *  @param message    提示信息
 *  @param completion 点击确定回调
 *
 *  @return UIAlertController
 */
+ (instancetype)hj_showSureAlertStyleTipWithVC:(UIViewController *)vc
                                       message:(NSString *)message
                                    completion:(HJCompletionBlcok)completion;


/**
 *  推出AlertStyle的含有textfield提示框(确认，取消)
 *
 *  @param vc         视图控制器
 *  @param message    提示信息
 *  @param completion 点击确定回调
 *
 *  @return UIAlertController
 */
+ (instancetype)hj_showSureAlertStyleTipWithVC:(UIViewController *)vc
                                   placeHolder:(NSString *)placeHolder
                                       message:(NSString *)message
                                    completion:(HJNSStringBlock)completion;

/**
 *  推出AlertStyle的含有textfield提示框(确认，取消)
 *
 *  @param vc         视图控制器
 *  @param message    提示信息
 *  @param completion 点击确定回调
 *  @param cancel     点击取消回调
 *
 *  @return UIAlertController
 */
+ (instancetype)hj_showSureAlertStyleTipWithVC:(UIViewController *)vc
                                       message:(NSString *)message
                                    completion:(HJCompletionBlcok)completion
                                   cancelBlock:(HJCancelBlock)cancel;

@end
