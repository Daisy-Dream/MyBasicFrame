//
//  UIGestureRecognizer+Block.m
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>

static char kGestureRecognizerKey;

@implementation UIGestureRecognizer (Block)

- (void)handleRecognizerBlock:(GestureRecognizerBlock)actionBlock{
    
    objc_setAssociatedObject(self, &kGestureRecognizerKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callGestureRecognizer:)];
}

- (void)callGestureRecognizer:(id)sender{
    
    GestureRecognizerBlock block = (GestureRecognizerBlock)objc_getAssociatedObject(self, &kGestureRecognizerKey);
    if (block) {
        block(self);
    }
}
@end
