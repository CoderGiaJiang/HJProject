////
////  AppDelegate+ADExtension.m
////  NormalAppFramework-noVersionInfo.
////
////  Created by User on 16/7/18.
////  Copyright © 2016年 AdwardWang. All rights reserved.
////
//
//#import "AppDelegate+ADExtension.h"
//
//
//
//@implementation AppDelegate (ADExtension)
//
///**
// *  检查版本更新，默认是 window.rootvc present出提示框，使用时只需替换 itunesAppId
// */
//- (void)ad_checkVersionUpdate
//{
//    // get AppInfo In Itunes
//    NSString *appInfo = [NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",itunesAppId]] encoding:NSUTF8StringEncoding error:nil];
//    
//    if (appInfo && [appInfo length] > 0 && [appInfo containsString:@"\"version\":"]) {
//        [self comparingVersionWithItunesAppInfo:appInfo];
//    }
//}
//
//
//- (void)comparingVersionWithItunesAppInfo:(NSString *)itunesAppInfo
//{
//    // get local current version
//    NSString *version = [[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleVersion"];
//    
//    // get itunes version
//    NSString *itunesVersion = [itunesAppInfo ad_stringBetweenFrontString: @"\"version\":\"" behindString:@"\","];
//    
//#if DEBUG
//    NSLog(@"ItunesVersion: %@, LocalAppVersion : %@",itunesVersion,version);
//#endif
//    // comparing version
//    if (![itunesVersion isEqualToString:version]) {
//        
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"新版本 %@ version 已更新", version]preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelAlertAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
//        UIAlertAction *goAlertAction = [UIAlertAction actionWithTitle:@"前往更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            
//            // get trackViewUrlDA
//            NSString *trackViewUrl = [itunesAppInfo ad_stringBetweenFrontString: @"\"trackViewUrl\":\""behindString:@"\","];
//            
//            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:trackViewUrl]];
//        }];
//        [alertController addAction:cancelAlertAction];
//        [alertController addAction:goAlertAction];
//        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
//    }
//    else
//    {
//#if DEBUG
//        NSLog(@"NO NEED UPDATE !");
//#endif
//    }
//    
//}
//
///**
// *  万能跳转到指定视图控制器，主要用于推送
// *
// *  @param name 视图控制器的类名
// *  @param dic  视图控制器对象的属性字典
// */
//- (void)ad_universalJumpToViewControllerWithClassName:(NSString *)name propertyDic:(NSDictionary *)dic;
//{
//    const char *className = [name cStringUsingEncoding:NSASCIIStringEncoding];
//    // From string to class
//    Class newClass = objc_getClass(className);
//    if (!newClass)
//    {    // Creat a class
//        Class superClass = [NSObject class];
//        newClass = objc_allocateClassPair(superClass, className, 0);
//        // Register class
//        objc_registerClassPair(newClass);
//    }
//    // Creat an object
//    id instance = [[newClass alloc] init];
//    // Assign a value to the property
//    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//        // Check whether the object has this property
//        if ([self ad_checkIsExistPropertyWithInstance:instance verifyPropertyName:key]) {
//            // Using KVC assignment
//            [instance setValue:obj forKey:key];
//        }
//    }];
//    
//    // Jump to the spectified viewController
//}
//
//- (BOOL)ad_checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName
//{
//    unsigned int outCount, i;
//    // Get the object all property list
//    objc_property_t *properties = class_copyPropertyList([instance class], &outCount);
//    for (i = 0; i < outCount; i++) {
//        objc_property_t property = properties[i];
//        // From property name to string
//        NSString *porpertyName = [[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//        // Check wheather the object has this property
//        if ([porpertyName isEqualToString:verifyPropertyName]) {
//            free(properties);
//            return YES;
//        }
//    }
//    free(properties);
//    return NO;
//}
//
//#pragma  mark - getui
//
//- (void)initGetTuiservice {
//    
//    // 通过 appId、 appKey 、appSecret 启动SDK，注：该方法需要在主线程中调用
//    [GeTuiSdk startSdkWithAppId:kGtAppId appKey:kGtAppKey appSecret:kGtAppSecret delegate:self];
//    
//    // 注册APNS
//    [self registerUserNotification];
//    
//    
//    
//}
//
//- (void)resetGeTui {
//    
//    [GeTuiSdk resetBadge];
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
//    
//}
//
//#pragma mark - 用户通知(推送) _自定义方法
//
///** 注册用户通知 */
//- (void)registerUserNotification {
//    
//    /*
//     注册通知(推送)
//     申请App需要接受来自服务商提供推送消息
//     */
//    
//    // 判读系统版本是否是“iOS 8.0”以上
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ||
//        [UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
//        
//        // 定义用户通知类型(Remote.远程 - Badge.标记 Alert.提示 Sound.声音)
//        UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
//        
//        // 定义用户通知设置
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
//        
//        // 注册用户通知 - 根据用户通知设置
//        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//    } else { // iOS8.0 以前远程推送设置方式
//        // 定义远程通知类型(Remote.远程 - Badge.标记 Alert.提示 Sound.声音)
//        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
//        
//        // 注册远程通知 -根据远程通知类型
//        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
//    }
//}
//
//#pragma mark - 用户通知(推送)回调 _IOS 8.0以上使用
//
///** 已登记用户通知 */
//- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
//    // 注册远程通知（推送）
//    [application registerForRemoteNotifications];
//}
//
//#pragma mark - 远程通知(推送)回调
//
///** 远程通知注册成功委托 */
//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
//    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSLog(@"\n>>>[DeviceToken Success]:%@\n\n", token);
//    // [3]:向个推服务器注册deviceToken
//    [GeTuiSdk registerDeviceToken:token];
//    
//    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
//    [userdefaults setObject:token forKey:UD_DEVICE_TOKEN];
//    [userdefaults synchronize];
//    
//}
//
///** 远程通知注册失败委托 */
//- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
//    NSLog(@"\n>>>[DeviceToken Error]:%@\n\n", error.description);
//}
//
//#pragma mark - APP运行中接收到通知(推送)处理
///** APP已经接收到“远程”通知(推送) - (App运行在后台/App运行在前台) */
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
//    application.applicationIconBadgeNumber = 0; // 标签
//    
//    NSLog(@"\n>>>[Receive RemoteNotification]:%@\n\n", userInfo);
//}
//
///** APP已经接收到“远程”通知(推送) - 透传推送消息  */
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
//    // 处理APN
//    NSLog(@"\n>>>[Receive RemoteNotification - Background Fetch]:%@\n\n", userInfo);
//    
//    completionHandler(UIBackgroundFetchResultNewData);
//}
//
//#pragma mark - GeTuiSdkDelegate
//
///** SDK启动成功返回cid */
//- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId {
//    
//    // [4-EXT-1]: 个推SDK已注册，返回clientId
//    //adward:96c73291a234807341f02236a30cc298
//    NSLog(@"\n>>>[GeTuiSdk RegisterClient]:%@\n\n", clientId);
//    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
//    [userdefaults setObject:clientId forKey:GETUI_CID];
//    [userdefaults synchronize];
//    
//}
//
///** SDK遇到错误回调 */
//- (void)GeTuiSdkDidOccurError:(NSError *)error {
//    // [EXT]:个推错误报告，集成步骤发生的任何错误都在这里通知，如果集成后，无法正常收到消息，查看这里的通知。
//    NSLog(@"\n>>>[GexinSdk error]:%@\n\n", [error localizedDescription]);
//    
//}
//
//
///** SDK收到透传消息回调 */
//- (void)GeTuiSdkDidReceivePayloadData:(NSData *)payloadData andTaskId:(NSString *)taskId andMsgId:(NSString *)msgId andOffLine:(BOOL)offLine fromGtAppId:(NSString *)appId {
//    
//    [self resetGeTui];
//    // [4]: 收到个推消息
//    NSString *payloadMsg = nil;
//    if (payloadData) {
//        payloadMsg = [[NSString alloc] initWithBytes:payloadData.bytes length:payloadData.length encoding:NSUTF8StringEncoding];
//    }
//    
//    NSString *msg = [NSString stringWithFormat:@"taskId=%@,messageId:%@,payloadMsg:%@%@", taskId, msgId, payloadMsg, offLine ? @"<离线消息>" : @""];
//    NSLog(@"\n>>>[GexinSdk ReceivePayload]:%@\n\n", msg);
//}
//
///** SDK收到sendMessage消息回调 */
//- (void)GeTuiSdkDidSendMessage:(NSString *)messageId result:(int)result {
//    // [4-EXT]:发送上行消息结果反馈
//    NSString *msg = [NSString stringWithFormat:@"sendmessage=%@,result=%d", messageId, result];
//    NSLog(@"\n>>>[GexinSdk DidSendMessage]:%@\n\n", msg);
//}
//
///** SDK运行状态通知 */
//- (void)GeTuiSDkDidNotifySdkState:(SdkStatus)aStatus {
//    // [EXT]:通知SDK运行状态
//    NSLog(@"\n>>>[GexinSdk SdkState]:%u\n\n", aStatus);
//    
//}
//
///** SDK设置推送模式回调 */
//- (void)GeTuiSdkDidSetPushMode:(BOOL)isModeOff error:(NSError *)error {
//    if (error) {
//        NSLog(@"\n>>>[GexinSdk SetModeOff Error]:%@\n\n", [error localizedDescription]);
//        return;
//    }
//    
//    NSLog(@"\n>>>[GexinSdk SetModeOff]:%@\n\n", isModeOff ? @"开启" : @"关闭");
//}
//
//
//
//
//@end
