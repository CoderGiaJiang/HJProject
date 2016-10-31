//
//  HJToolsKit.m
//  HJProject
//
//  Created by User on 2016/10/18.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "HJToolsKit.h"

@implementation HJToolsKit

/**
 寻找最上层的视图控制器
 
 @return 视图控制器
 */
+ (UIViewController *)hj_getTopViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
