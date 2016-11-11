//
//  HJNavigationController.m
//  HJProject
//
//  Created by User on 16/10/11.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "HJNavigationController.h"
#import "Header.h"

@interface HJNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation HJNavigationController

- (void)viewDidLoad {
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    //    [UINavigationBar appearance].barTintColor = THEMECOLOR;
    [self.navigationBar setBackgroundImage:[UIImage hj_imageWithColor:THEMECOLOR] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) { // 如果viewController不是最早push进来的子控制器
        UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButtonItem;
        
        // 隐藏底部的工具条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 所有设置搞定后, 再push控制器
    [super pushViewController:viewController animated:animated];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  手势识别器对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效, NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
    return self.childViewControllers.count > 1;
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
