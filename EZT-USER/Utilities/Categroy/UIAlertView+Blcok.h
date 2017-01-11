//
//  UIAlertView+Blcok.h
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertViewBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (Blcok) <UIAlertViewDelegate>
/**
 *  返回带回调的alert
 *
 *  @param title             标题
 *  @param cancelButtonTitle 取消
 *  @param message           描述
 *  @param otherButtonTitles 其他button
 *  @param block             事件回调
 *
 *  @return UIAlertView
 */
+ (instancetype)alertViewWithTitle:(NSString *)title
                 cancelButtonTitle:(NSString *)cancelButtonTitle
                           message:(NSString *)message
                 otherButtonTitles:(NSString *)otherButtonTitles
                             block:(AlertViewBlock) block;
@end
