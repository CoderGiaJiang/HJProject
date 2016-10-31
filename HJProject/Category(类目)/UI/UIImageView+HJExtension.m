//
//  UIImageView+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "UIImageView+HJExtension.h"

@implementation UIImageView (HJExtension)


/**
 *  创建一个头像, 添加轻拍手势
 *
 *  @param frame     在父视图中的 rect
 *  @param imageName 头像图片名
 *  @param handle    轻拍手势回调
 *
 *  @return 头像 ImageView
 */
+ (instancetype)hj_imageForAvatarWithFrame:(CGRect)frame
                                 imageName:(NSString *)imageName
                                 tapHandle:(HJTapGestuerBlcok)handle
{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = MIN(frame.size.width, frame.size.height) / 2;
    imageView.image = [UIImage imageNamed:imageName];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hj_tapGestureAction:)];
    [imageView addGestureRecognizer:tapGesture];
    objc_setAssociatedObject(self, (__bridge const void *)(tapGesture) , handle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
    return imageView;
}

/**
 *  根据大小,图片名称创建一个 图片视图(缓存)
 *
 *  @param frame     在父视图中的位置
 *  @param imageName 图片名称
 *
 *  @return 图片视图
 */
+ (instancetype)hj_imageViewCacheWithFrame:(CGRect)frame
                            imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}

/**
 *  根据大小,图片名称创建一个 图片视图(无缓存，图片需存在根目录下)
 *
 *  @param frame     在父视图中的位置
 *  @param imageName 图片名称
 *
 *  @return 图片视图
 */
+ (instancetype)hj_imageViewNoCacheWithFrame:(CGRect)frame
                            imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageWithContentsOfFile:imageName];
    return imageView;
}


/**
 轻拍手势触发方法

 @param tap 手势
 */
- (void)hj_tapGestureAction:(UITapGestureRecognizer *)tap
{
    HJTapGestuerBlcok block = objc_getAssociatedObject(self, (__bridge const void *)(tap));
    if (block) {
        block(tap);
    }
}


@end
