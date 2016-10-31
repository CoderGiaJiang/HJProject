//
//  UISegmentedControl+HJExtension.h
//  CRM
//
//  Created by User on 16/7/27.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (HJExtension)

/**
 *  新建圆角选项卡, 并默认选择第一个
 *
 *  @param items       图片或者标题数组
 *  @param frame       尺寸
 *  @param color       未选中颜色
 *  @param selectColor 选中颜色
 *  @return 选项卡对象
 */
+ (UISegmentedControl *)hj_segmentWithItems:(NSArray *)items
                                      frame:(CGRect)frame
                                      color:(UIColor *)color
                                selectColor:(UIColor *)selectColor
                          vauleChangeHandle:(HJSegmentBlock)handle;

@end
