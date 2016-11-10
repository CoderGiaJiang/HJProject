//
//  HJLocalPhoto.h
//  HJProject
//
//  Created by User on 16/10/11.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"

@interface HJLocalPhoto : NSObject


/**
 选择图片(通过 相册 和 照相 获得)

 @param viewController 推出的源视图控制器
 @param completion     获取图片回调
 */
- (void)hj_selectPhotoWithViewController:(UIViewController *)viewController completion:(HJImageBlcok)completion;

@end
