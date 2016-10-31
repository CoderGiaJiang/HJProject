//
//  Category.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#ifndef Category_h
#define Category_h

/********************** NS **********************/
#import "NSArray+HJExtension.h"
#import "NSDate+HJExtension.h"
#import "NSDictionary+HJExtension.h"
#import "NSMutableArray+HJExtension.h"
#import "NSString+HJExtension.h"
#import "NSObject+HJExtension.h"
#import "NSObject+XWAdd.h"

#pragma mark - NSArray
// 获取数组中索引对应的元素(防止数组越界)
// ASCII 升序排序
// ASCII 降序排序
// 深拷贝
// 新建含有n个空字符串的数组

#pragma mark - NSMutableArray
// 获取数组中索引对应的元素(防止数组越界)

#pragma mark - NSDate
// 判断某个时间是否为今年
// 判断某个时间是否为昨天
// 判断某个时间是否为今天

#pragma mark - NSDictinary
// 深拷贝
// 自定义字典转字符串方法

#pragma mark - NSString
/* 1. 字符串处理 */
// 获取两个字符串之间的字符串
// 删除字符串中的空格
// 删除首尾空格的字符串
// 删除首尾指定的字符集
// 删除指定的字符集
// 过滤特殊字符串
// 替换掉图片名的后缀 方便更换高清图片

/* 2.MD5 */
// MD5 加密字符串
// MD5 加密小写字符串
// MD5 加密字符串

/* 3.时间处理 */
// 时间字符串转 NSDate
// 获取到的时间戳展现成 分钟前 小时前 天前
// 获取当前时间
// 时间戳转时间
// 时间转时间戳

/* 4.计算尺寸 */
// 计算字符串的高度
// 计算字符串的宽度度

/* 5.其他 */
// 计算总文件夹所占内存大小
// 字符串转类

#pragma mark - NSObject
// 对系统方法进行替换
// 便捷添加观察者

/********************** UI **********************/
#import "UIImage+HJExtension.h"
#import "UIColor+HJExtension.h"
#import "UILabel+HJExtension.h"
#import "UIView+HJExtension.h"
#import "UINavigationBar+HJExtension.h"
#import "UIAlertController+HJExtension.h"
#import "UIImageView+HJExtension.h"
#import "UIControl+HJExtension.h"
#import "UISegmentedControl+HJExtension.h"
#import "UIBarButtonItem+HJExtension.h"

#pragma mark - UIImage
// 根据颜色创建图片 (1 * 1)
// 根据颜色和尺寸创建图片
// 16进制颜色创建图片 (1 * 1)
// 16进制颜色和尺寸创建图片
// 缩小图片的尺寸

#pragma mark - UIColor
// 返回颜色按照色彩的RGB 16进度的值

#pragma mark - UILabel
// 创建一个文字在中心的 UILabel
// 创建一个文字在靠左的 UILabel

#pragma mark - UIView
// Extension
// 找出符合响应类的第一响应者
// 通过一个xib创建多个自定义视图，然后根据 NibName 和 标识 获取视图
// 绘制水平方向的虚线
// 绘制竖直方向的虚线

// IB
// 利用 IBInspectable 给可视化编程提供没有的属性

#pragma mark - UINavigationBar
// 找到导航栏的下划线
// 设置导航栏字体颜色和文字大小

#pragma mark - UIAlertController
// 推出AlertStyle的提示框(确认)
// 推出AlertStyle的提示框(确认，取消)
// 推出AlertStyle的含有textfield提示框(确认，取消)(确认回调)
// 推出AlertStyle的含有textfield提示框(确认，取消)(确认/取消回调)

#pragma mark - UIImageView
// 创建一个头像视图, 添加轻拍手势
// 根据大小,图片名称创建一个 图片视图(缓存)
// 根据大小,图片名称创建一个 图片视图(无缓存，图片需存在根目录下)

#pragma mark - UISegmentedControl
// 新建圆角选项卡, 并默认选择第一个

#pragma mark - UIBarButtonItem
// 创建一个 UIBarButtonItem
// 创建一个只含有标题的UIBarButtonItem
// 创建一个只含有图片的UIBarButtonItem


#endif /* Category_h */
