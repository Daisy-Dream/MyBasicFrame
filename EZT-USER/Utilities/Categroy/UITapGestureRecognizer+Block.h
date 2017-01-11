//
//  UITapGestureRecognizer+Block.h
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITapGestureRecognizer (Block)

typedef void (^TapGestureRecognizerBlock)(id sender);

- (void)handleWithBlock:(TapGestureRecognizerBlock)actionBlock;
@end
