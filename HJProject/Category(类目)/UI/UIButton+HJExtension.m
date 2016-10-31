//
//  UIButton+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "UIButton+HJExtension.h"

@implementation UIButton (HJExtension)
/**
 *  水平排列，文字在左，图片在右
 *
 *  @param space 文字和图片间隔
 */
- (void)hj_setTitleImageHorizontalAlignmentWithSpace:(float)space;
{
    [self hj_resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGSize titleSize = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize = [self imageRectForContentRect:contentRect].size;
    
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width+space, 0, -titleSize.width - space)];
}

/**
 *  水平排列，图片在左，文字在右
 *
 *  @param space 图片和文字间隔
 */
- (void)hj_setImageTitleHorizontalAlignmentWithSpace:(float)space;
{
    [self hj_resetEdgeInsets];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, space, 0, -space)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
}

/**
 *  竖直排列，文字在上，图片在下
 *
 *  @param space 文字和图片的间距
 */
- (void)hj_setTitleImageVerticalAlignmentWithSpace:(float)space;
{
    [self hj_verticalAlignmentWithTitleTop:YES space:space];
}

/**
 *  竖直排列，图片在上，文字在下
 *
 *  @param space 图片和文字的间距
 */
- (void)hj_setImageTitleVerticalAlignmentWithSpace:(float)space;
{
    [self hj_verticalAlignmentWithTitleTop:NO space:space];
}

- (void)hj_verticalAlignmentWithTitleTop:(BOOL)isTop space:(float)space ;
{
    [self hj_resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGSize titleSize = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize = [self imageRectForContentRect:contentRect].size;
    
    float halfWidth = (titleSize.width + imageSize.width)/2;
    float halfHeight = (titleSize.height + imageSize.height)/2;
    
    float topInset = MIN(halfHeight, titleSize.height);
    float leftInset = (titleSize.width - imageSize.width)>0?(titleSize.width - imageSize.width)/2:0;
    float bottomInset = (titleSize.height - imageSize.height)>0?(titleSize.height - imageSize.height)/2:0;
    float rightInset = MIN(halfWidth, titleSize.width);
    
    
    if (isTop) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(-halfHeight-space, - halfWidth, halfHeight+space, halfWidth)];
        [self setContentEdgeInsets:UIEdgeInsetsMake(topInset+space, leftInset, -bottomInset, -rightInset)];
    } else {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(halfHeight+space, - halfWidth, -halfHeight-space, halfWidth)];
        [self setContentEdgeInsets:UIEdgeInsetsMake(-bottomInset, leftInset, topInset+space, -rightInset)];
    }
}
/**
 *  重置边缘间距
 */
- (void)hj_resetEdgeInsets
{
    [self setContentEdgeInsets:UIEdgeInsetsZero];
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
}

#pragma mark - 创建 UIButton
/**
 *  根据参数创建 UIButton
 *
 *  @param frame        在父视图的 Rect
 *  @param text         文字
 *  @param color        字体颜色
 *  @param selectColor  选择字体颜色
 *  @param fontSize     字体大小
 *  @param handle       点击回调
 *
 *  @return UIButton 对象
 */
+ (instancetype)hj_buttonWithFrame:(CGRect)frame
                              text:(NSString *)text
                         textColor:(UIColor *)color
                       selectColor:(UIColor *)selectColor
                              font:(CGFloat)fontSize
                            handle:(HJButtonBlock)handle
{
    UIButton *button = [[self class] buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:selectColor forState:UIControlStateSelected];
    button.adjustsImageWhenHighlighted = NO; // 取消高亮状态的置灰效果
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button hj_controlEvents:UIControlEventTouchUpInside actionHandle:^(UIControl *sender) {
        handle((UIButton *)sender);
    }];
    return button;
}


@end
