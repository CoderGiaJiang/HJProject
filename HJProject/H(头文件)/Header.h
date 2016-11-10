//
//  Header.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef void(^HJNoticationBlock)(NSNotification *notification);
typedef void(^HJImageBlcok)(UIImage *image);
typedef void(^HJImageViewBlcok)(UIImageView *imageView);
typedef void(^HJControlBlcok)(UIControl *sender);
typedef void(^HJTapGestuerBlcok)(UITapGestureRecognizer *tapGesture);
typedef void(^HJCompletionBlcok)(void);
typedef void(^HJCancelBlock)(void);
typedef void(^HJButtonBlock)(UIButton *sender);
typedef void(^HJBarBtnBlock)(UIBarButtonItem *sender);
typedef void(^HJSegmentBlock)(UISegmentedControl *sender);
typedef void(^HJNSStringBlock)(NSString *string);
typedef void(^HJNSArrayBlock)(NSArray *arr);

// pod 'SGNetObserver', '~> 1.0.0' // 网络状态判断工具

@interface Header : NSObject



@end





