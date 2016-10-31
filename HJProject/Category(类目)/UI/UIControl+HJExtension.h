//
//  UIControl+HJExtension.h
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (HJExtension)

- (void)hj_controlEvents:(UIControlEvents)controlEvents
            actionHandle:(HJControlBlcok)handle;

@end
