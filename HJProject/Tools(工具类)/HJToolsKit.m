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


/**
 判断是否为第一次打开APP
 
 @return YES OR NO
 */
+ (BOOL)hj_applicationFirstOpen;
{
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) { // 第一次登陆
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        return YES;
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"]; // 第二次登陆
        return NO;
    }
}

@end
