//
//  HJGuideView.h
//  HJProject
//
//  Created by User on 16/9/22.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJGuideView : UIView



/**
 添加启动界面
 [HJGuideView hj_guideWithImageNameArr:@[@"1", @"2", @"3", @"4"] viewController:rootViewController firstOpen:[self hj_applicationFirstOpen]];

 @param imageNameArr   图片数组名字，放在工程根目录下的图片,如:Resource
 @param viewController 引导图结束后切换的视图控制器(添加在改视图控制器上)
 @param firstOpen      布尔是否为第一次打开
 */
+ (void)hj_guideWithImageNameArr:(NSArray *)imageNameArr
                  viewController:(UIViewController *)viewController
                       firstOpen:(BOOL)firstOpen;


@end
