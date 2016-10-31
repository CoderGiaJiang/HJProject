//
//  UIImage+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HJExtension)

/**
 *  根据颜色创建图片 (1 * 1)
 *
 *  @param color 图片颜色
 *
 *  @return 图片
 */
+ (UIImage *)hj_imageWithColor:(UIColor *)color;

/**
 *  根据颜色和尺寸创建图片
 *
 *  @param color 图片颜色
 *  @param rect  图片尺寸
 *
 *  @return 图片
 */
+ (UIImage *)hj_imageWithColor:(UIColor *)color rect:(CGRect)rect;


/**
 *  16进制颜色创建图片 (1 * 1)
 *
 *  @param hexString 色码的 16 进制
 *
 *  @return 颜色
 */
+ (UIImage *)hj_imageWithHexString:(NSString *)hexString;

/**
 *  16进制颜色和尺寸创建图片
 *
 *  @param hexString 色码的 16 进制
 *  @param rect  图片尺寸
 *
 *  @return 图片
 */
+ (UIImage *)hj_imageWithHexString:(NSString *)hexString rect:(CGRect)rect;

/**
 *  缩小图片的尺寸
 *
 *  @param size     制定的尺寸
 *
 *  @return 被缩放后的图片
 */
- (UIImage*)hj_zoomImageWithScaleToSize:(CGSize)size;


/**
 压缩图片，对图片质量要求不是很高
 
 @param quality 压缩质量，压缩程度(0~1),越高失真越严重
 @param size 制定的尺寸
 @return 图片
 */
- (UIImage*)hj_compressImageWithCompressionQuality:(CGFloat)quality scaleToSize:(CGSize)size;

/**
 压缩图片，对图片质量要求比较高
 
 @param size 制定的尺寸
 @return 图片
 */
- (UIImage*)hj_compressImageScaleToSize:(CGSize)size;

/**
 给图片设置圆角，提高性能去除混合图层
 
 @param size 图片大小
 @param fillColor 填充颜色
 @param cornerRadius 圆角大小
 @param completion 完成回调
 */
- (void)hj_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor cornerRadius:(CGFloat)cornerRadius completion:(void (^)(UIImage *cornerImage))completion;

/**
 抗锯齿（添加透明边），也可用 layer.allowsEdgeAntialiasing = true，不过可能会降低帧数
 
 @return 图片
 */
- (UIImage *)hj_antiAlias;

@end
