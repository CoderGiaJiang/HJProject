//
//  Instruction.m
//  HJProject
//
//  Created by User on 16/9/22.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "Instruction.h"

@implementation Instruction

/******* 说明书 ******/
#pragma mark - 1. 启动图 和 应用图标 设置 (静态)
// 第一步: Assets.xcassets 中添加 AppIcon 和 LaunchImage 两个 item
// 第二步: (1) AppIcon: 根据 size 和 @2x @3x
//        (2) LaunchImage: 根据 屏幕大小(存) 和 @2x @3x
/******************   下面是参考参数   ******************/
/*
 IPhone 4s 3.5寸     (320 * 480) 2x
 IPhone 5s 4.0寸     (320 * 568) 2x
 IPhone 6s/6 4.7寸   (375 * 667) 2x
 IPhone 6sp/6p 5.5寸 (414 * 736) 3x (1080 * 1920)
 */

// 第三步: Project Setting - Tagets - General - AppIcons and LaunchImages 中 设置 AppIcons Source 和 LaunchImages Source 选择文件为先前设置的 item 名， Launch Screen 选项为空
// ***注: 调试过程中设置启动图不显示，需删除 App 重新运行

#pragma mark - 引导图
// 实现流程: 启动 App 判断是否为第一次启动(返回是或者否)，根据返回值确定是否执行对应的操作。传入参数: 启动图片数组(NSArray)、跳转对象

@end
