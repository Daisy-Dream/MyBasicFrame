//
//  UINavigationController+Extension.m
//  EZT-USER
//
//  Created by wangmei on 17/1/10.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import "UINavigationController+Category.h"

@implementation UINavigationController (Category)

/**
 *  找到指定的视图控制器
 *
 *  @param viewControllerType 控制器名称
 *
 *  @return 指定的视图控制器
 */
- (id)getSpecificViewController:(Class)viewControllerType
{
    int len = (int)self.viewControllers.count;
    for (int i = len - 1; i >= 0; --i)
    {
        UIViewController *vc = [self.viewControllers objectAtIndex:i];
        if([vc class] == viewControllerType)
        {
            return vc;
        }
    }
    return nil;
}


@end
