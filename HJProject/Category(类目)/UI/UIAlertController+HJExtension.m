//
//  UIAlertController+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "UIAlertController+HJExtension.h"

@implementation UIAlertController (HJExtension)


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
                                completion:(HJCompletionBlcok)completion
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // 点击确定, 退出分享界面
        [alertController dismissViewControllerAnimated:YES completion:nil];
        if (completion) {
            completion();
        }
        
    }];
    [alertController addAction:alertAction];
    [vc presentViewController:alertController animated:YES completion:nil];
    
    
    return alertController;
}

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
                                    completion:(HJCompletionBlcok)completion
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *canceltAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // 点击确定, 退出分享界面
        [alertController dismissViewControllerAnimated:YES completion:nil];
        if (completion) {
            completion();
        }
        
    }];
    [alertController addAction:canceltAction];
    [alertController addAction:sureAction];
    
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    
    return alertController;
}


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
                                    completion:(HJNSStringBlock)completion
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:message];
    [title addAttribute:NSFontAttributeName
                  value:[UIFont systemFontOfSize:20]
                  range:NSMakeRange(0, message.length)];
    [title addAttribute:NSForegroundColorAttributeName value:TEXTBLACKCOLOR range:NSMakeRange(0, message.length)];
    [alertController setValue:title forKey:@"attributedTitle"];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addTextFieldWithConfigurationHandler:nil];
    UITextField *textField = alertController.textFields[0];
    textField.placeholder = placeHolder;
    
    UIAlertAction *canceltAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // 点击确定, 退出分享界面
        [alertController dismissViewControllerAnimated:YES completion:nil];
        textField.placeholder = placeHolder;
        if (completion) {
            completion(textField.text);
        }
    }];
    [alertController addAction:canceltAction];
    [alertController addAction:sureAction];
    [vc presentViewController:alertController animated:YES completion:nil];
    
    
    return alertController;
}

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
                                   cancelBlock:(HJCancelBlock)cancel
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [alertController dismissViewControllerAnimated:YES completion:nil];
        if (cancel) {
            cancel();
        }
    }];
    UIAlertAction *canceltAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // 点击确定, 退出分享界面
        [alertController dismissViewControllerAnimated:YES completion:nil];
        if (completion) {
            completion();
        }
        
    }];
    [alertController addAction:canceltAction];
    [alertController addAction:sureAction];
    [vc presentViewController:alertController animated:YES completion:nil];
    
    
    return alertController;
}


@end
