//
//  UIGestureRecognizer+Block.h
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureRecognizerBlock)(id sender);

@interface UIGestureRecognizer (Block)

- (void)handleRecognizerBlock:(GestureRecognizerBlock)actionBlock;
@end
