//
//  UIView+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "UIView+HJExtension.h"

@implementation UIView (HJExtension)

#pragma mark - setter and getter
- (CGSize)size {
    
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)width {
    
    return self.frame.size.width;
}


- (CGFloat)height {
    
    return self.frame.size.height;
}


- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)centerX {
    
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY {
    
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY {
    
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}
- (void)setRight:(CGFloat)right {
    
    self.x = right - self.width;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom {
    
    self.y = bottom - self.height;
}

/**
 *  找出符合响应类的第一响应者
 *
 *  @param aclass 所响应的类
 *
 *  @return 响应类
 */
- (nullable id)hj_findResponderWithClass:(nonnull Class)aclass{
    UIResponder *nextResponder = self.nextResponder;
    
    while (nextResponder) {
        
        if ([nextResponder isKindOfClass:aclass]) {
            return nextResponder;
        }
        nextResponder = nextResponder.nextResponder;
    }
    return nil;
}

/**
 *  通过一个xib创建多个自定义视图，然后根据 NibName 和 标识 获取视图
 *
 *  @param name       nibName
 *  @param identifier 标识
 *
 *  @return 视图
 */
+ (nullable instancetype)hj_nibWithNibName:(NSString *)name
                             restorationId:(NSString *)identifier
{
    for (UIView *view in [[UINib nibWithNibName:name bundle:nil] instantiateWithOwner:self options:nil]) {
        if ([view.restorationIdentifier isEqualToString:identifier]) {
            return view;
        }
    }
    return nil;
}

/*
 *  绘制水平方向的虚线
 *
 *  @param lineView	    需要绘制成虚线的view
 *  @param lineLength   虚线的宽度
 *  @param lineSpacing  虚线的间距
 *  @param lineColor	虚线的颜色
 */
- (void)drawDashLine:( UIView * __nullable )lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *__nullable)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}


/*
 *  绘制竖直方向的虚线
 *
 *  @param lineView	    需要绘制成虚线的view
 *  @param lineLength   虚线的宽度
 *  @param lineSpacing  虚线的间距
 *  @param lineColor	虚线的颜色
 */
- (void)drawVerticallyDashLine:(UIView *__nullable)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *__nullable)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame), CGRectGetHeight(lineView.frame) / 2)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetWidth(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(lineView.frame));
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
    
}

@end
