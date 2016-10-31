//
//  HYBTextView.h
//
//  Created by huangyibiao on 14-6-3.
//  Copyright (c) 2014年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 * @brief 继承于UITextView，添加了placeholder支持，就像UITextField一样的拥有placeholder功能
 * @author huangyibiao
 */
@interface HYBTextView : UITextView

/*!
 * @brief 占位符文本,与UITextField的placeholder功能一致
 */
@property (nonatomic, strong) NSString *placeholder;

/*!
 * @brief 占位符文本颜色
 */
@property (nonatomic, strong) UIColor *placeholderTextColor;

@end