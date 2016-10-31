//
//  UIBarButtonItem+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "UIBarButtonItem+HJExtension.h"

static char itemActionKey;
@implementation UIBarButtonItem (HJExtension)

/**
 *  创建一个 UIBarButtonItem
 *
 *  @param image     默认图片
 *  @param highImage 高亮状态的图片
 *  @param handle    按钮点击回调
 *
 *  @return UIBarButtonItem 对象
 */
+ (instancetype)hj_itemWithImage:(NSString *)image
                       highImage:(NSString *)highImage
                          handle:(HJButtonBlock)handle{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button hj_controlEvents:UIControlEventTouchUpInside actionHandle:^(UIControl *sender) {
        handle((UIButton *)sender);
    }];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

/**
 *  创建一个只含有标题的UIBarButtonItem
 *
 *  @param title  标题
 *  @param handle 点击回调
 *
 *  @return UIBarItem
 */
+ (instancetype)hj_itemWithTitle:(NSString *)title  handle:(HJBarBtnBlock)handle
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector (hj_barButtonItemAction:)];
    objc_setAssociatedObject(item, &itemActionKey, handle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return item;
}

/**
 *  创建一个只含有图片的UIBarButtonItem
 *
 *  @param image  图片
 *  @param handle 点击回调
 *
 *  @return UIBarItem
 */
+ (instancetype)hj_itemWithImage:(UIImage *)image  handle:(HJBarBtnBlock)handle
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector (hj_barButtonItemAction:)];
    objc_setAssociatedObject(item, &itemActionKey, handle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return item;
}

+ (void)hj_barButtonItemAction:(UIBarButtonItem *)sender
{
    HJBarBtnBlock block = objc_getAssociatedObject(sender, &itemActionKey);
    if (block) {
        block(sender);
    }
}

@end
