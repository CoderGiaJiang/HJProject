//
//  ADBaseViewController.h
//  NormalAppFramework-noVersionInfo.
//
//  Created by User on 16/7/18.
//  Copyright © 2016年 AdwardWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADBaseViewController : UIViewController

@property (nonatomic, assign) BOOL isStatusBarHidden; // 是否隐藏状态栏, 默认是NO
@property (nonatomic, assign) BOOL isTopBarNightMode; // 是否设置状态栏和导航栏为夜间模式，默认是NO (当设置了 backgroundImage 时，只会改变状态栏文字颜色)
@property (nonatomic, assign) BOOL isNagationBarHidden; // 默认是NO, 如果为 YES, 隐藏导航栏，视图控制器消失时恢复显示, 在视图将要出现前设置
@property (nonatomic, strong) NSString *backItemTitle;// 设置返回按钮的标题

#pragma mark - Notification Method
/**
 *  根据名字添加通知
 *
 *  @param name     通知名字
 *  @param recetive 接收通知回调
 */
- (void)ad_addNotificationCenterWithName:(NSString *)name recetive:(ADNoticationBlock)recetive;

/**
 *  根据名字删除通知
 *
 *  @param name 通知名字
 */
- (void)ad_removeNotificationWithName:(NSString *)name;

/**
 *  移除所有通知
 */
- (void)ad_removeAllNotification;

#pragma mark - ImagePickerController Method
/**
 *  打开系统相机
 *
 *  @param completion 返回图片回调
 */
- (void)ad_openCameraCompletion:(ADImageBlcok)completion;

/**
 *  打开系统相册
 *
 *  @param completion 返回图片回调
 */
- (void)ad_openAlbumCompletion:(ADImageBlcok)completion;

/**
 *  保存图片到相册
 */
- (void)ad_saveImageToAlbumWithImage:(UIImage *)image complection:(ADCompletionBlcok)completion;

#pragma mark - MJRefesh

// 头部刷新
- (void)mj_headerRefesh;

// 底部刷新
- (void)mj_footerRefesh;

@end
