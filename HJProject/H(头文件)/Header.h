//
//  Header.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


typedef void(^HJNoticationBlock)(NSNotification *notification);
typedef void(^HJImageBlcok)(UIImage *image);
typedef void(^HJImageViewBlcok)(UIImageView *imageView);
typedef void(^HJControlBlcok)(UIControl *sender);
typedef void(^HJTapGestuerBlcok)(UITapGestureRecognizer *tapGesture);
typedef void(^HJCompletionBlcok)(void);
typedef void(^HJCancelBlock)(void);
typedef void(^HJButtonBlock)(UIButton *sender);
typedef void(^HJBarBtnBlock)(UIBarButtonItem *sender);
typedef void(^HJSegmentBlock)(UISegmentedControl *sender);
typedef void(^HJNSStringBlock)(NSString *string);
typedef void(^HJNSArrayBlock)(NSArray *arr);

// 常量
#import "CommonConst.h"

// 基类
#import "HJTableViewController.h"
#import "HJTabBarController.h"
#import "HJBaseViewController.h"
#import "HJNavigationController.h"

// 工具类
#import "HJToolsKit.h"
#import "KVOArray.h"

// 类目
#import "Category.h"

// 常用功能
#import "HJGuideView.h"// 引导图
#import "HJCoreLocationManager.h" // 定位
#import "HJLocalPhoto.h"

// pod 'SGNetObserver', '~> 1.0.0' // 网络状态判断工具

/*********** App 迭代开发版原则 ***********/
//1.Bug修复或者优化功能, 只修改叠加第三位数字，其他不变
//2.增加了一个新功能, 叠加修改第二位数字, 并清空第三位数字为0
//3.App需求功能大改, 更新量非常大, 需要叠加修改第一位数字, 清空其他数字为0

#define BASEURL [NSString stringWithFormat:@"http://%@/dellcrm/index.php/Api/", SERVERURL]
#define IMAGEUPLOADURL [NSString stringWithFormat:@"http://%@/dellcrm/index.php/Api/Index/uploadImg", SERVERURL]
#define TESTIMG_HEADER_URL  [NSString stringWithFormat:@"http://%@/dellcrm/Public/Uploads/", SERVERURL]

// @# 在变量前加，可令字符串省去加 @""

/************************     路径    ************************/
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

/************************  ARC & MRC  ************************/
// ARC 和 MRC
#if __has_feature(objc_arc)
// ARC
#else
// MRC
#endif

/************************     日志    ************************/
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif

/************************     颜色    ************************/
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define kRGBColor(r, g, b) ADColorA((r), (g), (b), 255)
#define kRandomColor ADColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define THEMECOLOR [UIColor hj_colorWithHexString:@"3BAFFF" alpha:1]
#define LINEGRAYCOLOR [UIColor hj_colorWithHexString:@"DDDDDD" alpha:1]
#define GROUPTABLECOLOR [UIColor hj_colorWithHexString:@"F2F2F2" alpha:1]
#define TEXTGRAYCOLOR [UIColor hj_colorWithHexString:@"999999" alpha:1]
#define TEXTBLACKCOLOR [UIColor hj_colorWithHexString:@"333333" alpha:1]
#define MASKCOLOR [UIColor colorWithWhite:0.5 alpha:0.7];
#define ORANGECOLOR [UIColor hj_colorWithHexString:@"F29F5E" alpha:1]
#define FONT [UIFont fontWithName:@"PingFangSC-Regular" size:17]
#define GRAY_COLOR [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]

/************************     尺寸    ************************/
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds


/************************   手机设备   ************************/
// 判断是不是iOS系统，如果是iOS系统在真机和模拟器输出都是YES
#if TARGET_OS_IPHONE
#endif

#if (TARGET_IPHONE_SIMULATOR)
// 在模拟器的情况下
#else
// 在真机情况下
#endif

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// iPhone 5 = iPhone 5s = iPhone SE
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && ScreenH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && ScreenH == 568.0)
#define IS_IPHONE_5_OR_LESS (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS)
#define IS_IPHONE_6 (IS_IPHONE && ScreenH == 667.0)
#define IS_IPHONE_6_OR_LESS (IS_IPHONE_6 || IS_IPHONE_5_OR_LESS)
#define IS_IPHONE_6_LATER (IS_IPHONE && ScreenH > 667.0)
#define IS_IPHONE_6P (IS_IPHONE && ScreenH == 736.0)
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f


/************************   iOS版本   ************************/
#define IOS7_OR_LATER (floorf(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)
#define IOS8_OR_LATER (floorf(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)

#define IOS_SYSTEM_STRING [[UIDevice currentDevice] systemVersion]

/************************ 常用单例对象  ************************/
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#define NOTIFICATION_CENTER [NSNotificationCenter defaultCenter]
#define STORYBOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define APPLICATION [UIApplication sharedApplication]
#define KEYWINDOW [UIApplication sharedApplication].keyWindow
#define DELEGATE_WINDOW ((AppDelegate *)[UIApplication sharedApplication].delegate).window

/************************     GCD     ************************/
#define DELEAY(time, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), block);

//一次性执行
#define DISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//在Main线程上运行
#define DISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//开启异步线程
#define DISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlock);

/************************    常用方法    ************************/
// 随机数
#define RANDOM_NUM(MIN, MAX) (arc4random()%((MAX) - (MIN) + 1) + (MIN))
// 获取图片
#define kCacheImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
#define kNOCacheImage(imageName) [UIImage imageWithContentsOfFile:@""];
// 获取当前语言
#define CURRENT_LANGUAGES ([[NSLocale preferredLanguages] objectAtIndex:0])
// 角度（Degrees） 和 弧度（Radian） 转换
#define DEGREES_TO_RADIAN(x) (M_PI * (x) / 180.0)
#define RADIAN_TO_DEGREES(radian) (radian*180.0)/(M_PI)
// 弱引用 和 强引用
#define WEAK(oject)  __weak typeof(oject) weak##type = oject;
#define STRONG(oject)  __strong typeof(oject) oject = weak##oject;

// 判断是否为空
static inline BOOL isEmpty(id thing) {
    
    return thing == nil || [thing isEqual:[NSNull null]]
    
    || ([thing respondsToSelector:@selector(length)]
        
        && [(NSData *)thing length] == 0)
    
    || ([thing respondsToSelector:@selector(count)]
        
        && [(NSArray *)thing count] == 0)
    ;
    
}

// 单例
// 在 .h 文件下面写 singleton_interface(类名)
#define singleton_interface(class)  + (class *)shared##class;

// 在 .m 文件下面写 singleton_implementation(类名）
// \ 代表下一行也属于宏
// ## 是分隔符, 识别参数
#define singleton_implementation(class) \
static class *_instance; \
\
+ (class *)shared##class \
{ \
if (_instance == nil) { \
_instance = [[self alloc] init]; \
} \
return _instance; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
}







@interface Header : NSObject



@end





