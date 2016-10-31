//
//  AppDelegate+HJExtension.m
//  HJProject
//
//  Created by User on 16/9/22.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "AppDelegate+HJExtension.h"

@implementation AppDelegate (HJExtension)

/**
 判断是否为第一次打开APP
 
 @return YES OR NO
 */
- (BOOL)hj_applicationFirstOpen;
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
