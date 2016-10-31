
//
//  UIControl+HJExtension.m
//  HJProject
//
//  Created by User on 16/10/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "UIControl+HJExtension.h"
static char valueChangeActionKey;

@implementation UIControl (HJExtension)

- (void)hj_controlEvents:(UIControlEvents)controlEvents
            actionHandle:(HJControlBlcok)handle
{
    [self removeTarget:self action:@selector(hj_controlActionHandle:)  forControlEvents:controlEvents];
    if (handle) {
        [self addTarget:self action:@selector(hj_controlActionHandle:) forControlEvents:controlEvents];
        objc_setAssociatedObject(self, &valueChangeActionKey, handle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)hj_controlActionHandle:(UIControl *)sender
{
    HJControlBlcok block = objc_getAssociatedObject(self, &valueChangeActionKey);
    if (block) {
        block(sender);
    }
}

@end
