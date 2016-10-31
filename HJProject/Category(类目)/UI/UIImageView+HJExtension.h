//
//  UIImageView+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HJExtension)

/**
 *  创建一个头像视图, 添加轻拍手势
 *
 *  @param frame     在父视图中的 rect
 *  @param imageName 头像图片名
 *  @param handle    轻拍手势回调
 *
 *  @return 头像 ImageView
 */
+ (instancetype)hj_imageForAvatarWithFrame:(CGRect)frame
                                 imageName:(NSString *)imageName
                                 tapHandle:(HJTapGestuerBlcok)handle;

/**
 *  根据大小,图片名称创建一个 图片视图(缓存)
 *
 *  @param frame     在父视图中的位置
 *  @param imageName 图片名称
 *
 *  @return 图片视图
 */
+ (instancetype)hj_imageViewCacheWithFrame:(CGRect)frame
                                 imageName:(NSString *)imageName;

/**
 *  根据大小,图片名称创建一个 图片视图(无缓存，图片需存在根目录下)
 *
 *  @param frame     在父视图中的位置
 *  @param imageName 图片名称
 *
 *  @return 图片视图
 */
+ (instancetype)hj_imageViewNoCacheWithFrame:(CGRect)frame
                                   imageName:(NSString *)imageName;
@end
