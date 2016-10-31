//
//  UIImage+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "UIImage+HJExtension.h"

@implementation UIImage (HJExtension)


/**
 *  根据颜色创建图片 (1 * 1)
 *
 *  @param color 图片颜色
 *
 *  @return 图片
 */
+ (UIImage *)hj_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    return [[self class]hj_imageWithColor:color rect:rect];
}

/**
 *  根据颜色创建图片
 *
 *  @param color 图片颜色
 *  @param rect  图片尺寸
 *
 *  @return 图片
 */
+ (UIImage *)hj_imageWithColor:(UIColor *)color rect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


/**
 *  16进制颜色代替 Img 图片 (1 * 1)
 *
 *  @param hexString 色码的 16 进制
 *
 *  @return 颜色
 */
+ (UIImage *)hj_imageWithHexString:(NSString *)hexString
{
    UIColor *color = [UIColor hj_colorWithHexString:hexString alpha:1];
    return [[self class]hj_imageWithColor:color];
}

/**
 *  根据16进制颜色和尺寸创建图片
 *
 *  @param hexString 色码的 16 进制
 *  @param rect  图片尺寸
 *
 *  @return 图片
 */
+ (UIImage *)hj_imageWithHexString:(NSString *)hexString rect:(CGRect)rect
{
    UIColor *color = [UIColor hj_colorWithHexString:hexString alpha:1];
    return [[self class]hj_imageWithColor:color rect:rect];
}

/**
 *  缩小图片的尺寸
 *
 *  @param size     制定的尺寸
 *
 *  @return 被缩放后的图片
 */
- (UIImage*)hj_zoomImageWithScaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}


/**
 给图片设置圆角，提高性能去除混合图层

 @param size 图片大小
 @param fillColor 填充颜色
 @param cornerRadius 圆角大小
 @param completion 完成回调
 */
- (void)hj_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor cornerRadius:(CGFloat)cornerRadius completion:(void (^)(UIImage *cornerImage))completion{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSTimeInterval start = CACurrentMediaTime();
        // 1. 利用绘图，建立上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        // 2. 设置填充颜色
        [fillColor setFill];
        UIRectFill(rect);
        // 3. 利用 贝赛尔路径 `裁切 效果
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10];
        [path addClip];
        // 4. 绘制图像
        [self drawInRect:rect];
        // 5. 取得结果
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        // 6. 关闭上下文
        UIGraphicsEndImageContext();
        NSLog(@"%f", CACurrentMediaTime() - start);
        // 7. 完成回调
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion != nil) {
                completion(result);
            }
        });
    });
}


/**
 抗锯齿（添加透明边），也可用 layer.allowsEdgeAntialiasing = true，不过可能会降低帧数

 @return 图片
 */
- (UIImage *)hj_antiAlias
{
    CGFloat border = 1.0f;
    CGRect rect = CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border);
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}

@end
