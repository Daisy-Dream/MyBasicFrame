//
//  UINavigationController+Extension.h
//  EZT-USER
//
//  Created by wangmei on 17/1/10.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  ViewController *vc = [self.navigationController getSpecificViewController:[ViewController class]];
 */
@interface UINavigationController (Category)
/**
 *  找到指定的视图控制器
 *
 *  @param viewControllerType 控制器名称
 *
 *  @return 指定的视图控制器
 */
- (id)getSpecificViewController:(Class)viewControllerType;

@end
