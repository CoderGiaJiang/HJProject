//
//  HJToolsKit.h
//  HJProject
//
//  Created by User on 2016/10/18.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJToolsKit : NSObject

/**
 寻找最上层的视图控制器
 
 @return 视图控制器
 */
+ (UIViewController*)hj_getTopViewController;

@end
