//
//  UIActionSheet+Block.m
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import "UIActionSheet+Block.h"
#import <objc/runtime.h>

static char kActionSheetKey;
@implementation UIActionSheet (Block)

- (void)showInView:(UIView *)view handleBlock:(ActionSheetBlock)block{
    
    objc_setAssociatedObject(self, &kActionSheetKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self setDelegate:self];
    [self showInView:view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    ActionSheetBlock block = (ActionSheetBlock)objc_getAssociatedObject(self, &kActionSheetKey);
    if (block) {
        if (buttonIndex == actionSheet.cancelButtonIndex) {
            return;
        }
        block(actionSheet,buttonIndex);
    }
}
@end
