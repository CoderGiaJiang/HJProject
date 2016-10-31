//
//  UIView+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HJExtension)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

/**
 *  找出符合响应类的第一响应者
 *
 *  @param aclass 所响应的类
 *
 *  @return 响应类
 */
- (nullable id)hj_findResponderWithClass:(nonnull Class)aclass;


/**
 *  通过一个xib创建多个自定义视图，然后根据 NibName 和 标识 获取视图
 *
 *  @param name       nibName
 *  @param identifier 标识
 *
 *  @return 视图
 */
+ (nullable instancetype)hj_nibWithNibName:(NSString * __nullable)name
                             restorationId:(NSString *__nullable)identifier;

/*
 *  绘制水平方向的虚线
 *
 *  @param lineView	    需要绘制成虚线的view
 *  @param lineLength   虚线的宽度
 *  @param lineSpacing  虚线的间距
 *  @param lineColor	虚线的颜色
 */
- (void)drawDashLine:( UIView * __nullable )lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *__nullable)lineColor;

/*
 *  绘制竖直方向的虚线
 *
 *  @param lineView	    需要绘制成虚线的view
 *  @param lineLength   虚线的宽度
 *  @param lineSpacing  虚线的间距
 *  @param lineColor	虚线的颜色
 */
- (void)drawVerticallyDashLine:(UIView *__nullable)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *__nullable)lineColor;

@end
