//
//  UIButton+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HJExtension)

/**
 *  水平排列，文字在左，图片在右
 *
 *  @param space 文字和图片间隔
 */
- (void)hj_setTitleImageHorizontalAlignmentWithSpace:(float)space;

/**
 *  水平排列，图片在左，文字在右
 *
 *  @param space 图片和文字间隔
 */
- (void)hj_setImageTitleHorizontalAlignmentWithSpace:(float)space;

/**
 *  竖直排列，文字在上，图片在下
 *
 *  @param space 文字和图片的间距
 */
- (void)hj_setTitleImageVerticalAlignmentWithSpace:(float)space;

/**
 *  竖直排列，图片在上，文字在下
 *
 *  @param space 图片和文字的间距
 */
- (void)hj_setImageTitleVerticalAlignmentWithSpace:(float)space;

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
                            handle:(HJButtonBlock)handle;

@end
