//
//  HJTabBarController.m
//  HJProject
//
//  Created by User on 16/10/11.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "HJTabBarController.h"

@interface HJTabBarController ()<UITabBarControllerDelegate>

@end

@implementation HJTabBarController

// 单例
+ (HJTabBarController *)shareInstance {
    
    static dispatch_once_t pred;
    static HJTabBarController *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[HJTabBarController alloc] init];
    });
    
    return shared;
}

#pragma mark - view cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**** 设置所有UITabBarItem的文字属性 ****/
    [self hj_setupItemTitleTextAttributes];
    /**** 添加子控制器 ****/
    
    // 设置 TabBarItem 文字偏移
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    // 设置 TabBar 颜色
    self.tabBar.tintColor = kRGBAColor(1, 1, 1, 1);
    self.tabBar.barTintColor = [UIColor whiteColor];
    [self xw_addNotificationForName:SLECTED_TABBAR_PERSONAL_NOTIFICATION block:^(NSNotification * _Nonnull notification) {
        // 更新 TabBarController 的界面
    }];
    
}

// 设置所有UITabBarItem的文字属性
- (void)hj_setupItemTitleTextAttributes
{
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

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
                    selectedImage:(NSString *)selectedImage
{
    //    viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    [viewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    viewController.tabBarItem.title = title;
    if (image.length) { // 图片名有具体值
        viewController.tabBarItem.image = [UIImage imageNamed:image];
        viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:viewController];
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController  {
    
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
