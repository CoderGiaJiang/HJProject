//
//  Header.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#ifndef Header_h
#define Header_h


// pod 'SGNetObserver', '~> 1.0.0' // 网络状态判断工具

#endif /* Header_h */


#import <UIKit/UIKit.h>

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

// Cocoapods
#import <Masonry.h>
#import <MJRefresh.h>

//#import "UIView+ADExtension.h"
//#import "UIBarButtonItem+ADExtension.h"
//#import "UINavigationBar+ADExtension.h"
//#import "UIAlertController+ADExtension.h"
//#import "UIWindow+ADExtension.h"
//#import "UIButton+ADExtension.h"
//#import "UIImageView+ADExtension.h"
//#import "UILabel+ADExtension.h"
//#import "UISegmentedControl+ADExtension.h"
//#import "NSString+ADExtension.h"
//#import "NSArray+ADExtension.h"
//#import "NSDictionary+ADExtension.h"
//#import "UIImage+ADExtension.h"
//#import "UIColor+ADExtension.h"
//#import "NSObject+XWAdd.h"
//#import "HYBTextView.h"

//#import "RegularExpression.h"
//#import "Area.h"
//#import "DataModels.h"
//#import "AccountTool.h"
//
//#import <UIScrollView+SVPullToRefresh.h>
//#import <UIScrollView+SVInfiniteScrolling.h>
//#import <Masonry.h>
////#import "ADGifHeaderRefresh.h"
//#import "ADBaseViewController.h"
//#import "ADCoreLocationManager.h"
//#import "ADTableViewController.h"
//#import "ADStaticTableViewController.h"
//#import "HSDatePickerViewController.h"
//
//#import "Factory.h"
//#import "BANetManager.h"
//#import "ClientInfoProcessor.h" // 客户信息修改管理器
//
//#import "UIScrollView+WHC_PullRefresh.h"
//#import "MJRefresh.h"
//#import "UIImage+GIF.h"
//
#import <objc/runtime.h>
#import <objc/objc.h>
//#import <MJExtension.h>
//#import <SVProgressHUD.h>
//#import <UIImageView+WebCache.h>
//#import "UIImage+Resize.h"

// Popular Functions
#import "HJGuideView.h" // 引导图
#import "HJCoreLocationManager.h" // 定位

#import "AppDelegate+HJExtension.h"

#import "AppDelegate.h"

#import "Category.h"

#define  STATUS_COMPANY_ARRAY  @"CompanyClientStatusArray"
#define  STATUS_PERSONAL_ARRAY @"PersonClientStatusArray"

#define SLECTED_TABBAR_PERSONAL_NOTIFICATION @"SLECTED_TABBAR_PERSONAL_NOTIFICATION"
#define UD_DEVICE_TOKEN @"DeviceToken"
#define GETUI_CID @"getuiCid"
#define PUSHON @"pushon"
#define USERNAME @"username"

//test
#define xiaocaiServerurl @"http://192.168.1.11"
//distribution
#define distributionServerurl @"http://183.2.185.89"
//production
#define productionTest @"http://14.29.114.85"

#define SERVERURL productionTest

#define BASEURL [NSString stringWithFormat:@"%@/dellcrm/index.php/Api/", SERVERURL]
#define IMAGEUPLOADURL [NSString stringWithFormat:@"%@/dellcrm/index.php/Api/Index/uploadImg", SERVERURL]
#define TESTIMG_HEADER_URL  [NSString stringWithFormat:@"%@/dellcrm/Public/Uploads/", SERVERURL]


/*! weak */
#define AD_Weak  __weak __typeof(self) weakSelf = self

/*** 日志 ***/
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif

#define ADLogFunc NSLog(@"%s", __func__);

/*** 颜色 ***/
#define ADColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define ADColor(r, g, b) ADColorA((r), (g), (b), 255)
#define ADRandomColor ADColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define ADGrayColor(v) ADColor((v), (v), (v))
#define ADCommonBgColor ADGrayColor(206)

#define THEMECOLOR [UIColor hj_colorWithHexString:@"3BAFFF" alpha:1]
#define LINEGRAYCOLOR [UIColor hj_colorWithHexString:@"DDDDDD" alpha:1]
#define GROUPTABLECOLOR [UIColor hj_colorWithHexString:@"F2F2F2" alpha:1]
#define TEXTGRAYCOLOR [UIColor hj_colorWithHexString:@"999999" alpha:1]
#define TEXTBLACKCOLOR [UIColor hj_colorWithHexString:@"333333" alpha:1]
#define MASKCOLOR [UIColor colorWithWhite:0.5 alpha:0.7];
#define ORANGECOLOR [UIColor hj_colorWithHexString:@"F29F5E" alpha:1]
#define FONT [UIFont fontWithName:@"PingFangSC-Regular" size:17]
#define GRAY_COLOR [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]

/**** 尺寸 ****/
#define KEYWINDOW [UIApplication sharedApplication].keyWindow
#define DELEGATE_WINDOW ((AppDelegate *)[UIApplication sharedApplication].delegate).window
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds


/**** 手机设备 ****/
#define IS_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && ScreenH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && ScreenH == 568.0)
#define IS_IPHONE_5_OR_LESS (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS)
#define IS_IPHONE_6 (IS_IPHONE && ScreenH == 667.0)
#define IS_IPHONE_6_OR_LESS (IS_IPHONE_6 || IS_IPHONE_5_OR_LESS)
#define IS_IPHONE_6_LATER (IS_IPHONE && ScreenH > 667.0)
#define IS_IPHONE_6P (IS_IPHONE && ScreenH == 736.0)


/**** iOS 版本 ****/
#define IOS7_OR_LATER (floorf(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)
#define IOS8_OR_LATER (floorf(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)

/** 获取sharedApplication */


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


// 单例
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#define NOTIFICATION_CENTER [NSNotificationCenter defaultCenter]
#define STORYBOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define APPLICATION [UIApplication sharedApplication]

// Weak
#define WEAK(object) __weak typeof (object) weak##object = object;

// 延时
#define DELEAY(time, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), block);

// 回到主线程
#define MAIN_THREAD(block)  dispatch_async(dispatch_get_main_queue(), ^{block});

// 随机数
#define RANDOM(MIN, MAX) (arc4random()%((MAX) - (MIN) + 1) + (MIN))

#define YEAY_MONTH_DAY_HOUR_MIN_SEC @"yyyy-MM-dd HH:mm:ss"
#define YEAY_MONTH_DAY_HOUR_MIN @"yyyy-MM-dd HH:mm"
#define YEAY_MONTH_DAY @"yyyy-MM-dd"

#define CODE_SUCCESS 0
#define CODE_NODATA  50002
//
//$error_code[0] = '成功';
//$error_code[50001] = '参数错误';
//$error_code[50002] = '暂无数据';
//$error_code[50003] = '其他错误';
//$error_code[50004] = '未知错误';
//
//$error_code[51001] = '需要GET请求';
//$error_code[51002] = '需要POST请求';
//$error_code[51003] = '需要HTTPS请求';
//
//$error_code[52001] = '数据库查询错误';
//$error_code[52002] = '数据库添加错误';
//$error_code[52003] = '数据库更新错误';
//$error_code[52004] = '数据库删除错误';
