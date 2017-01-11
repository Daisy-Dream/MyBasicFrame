//
//  UISwitch+Blcok.h
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISwitch (Blcok)
- (void)handleWithBlock:(MFButtonActionBlock)actionBlock controlEvent:(UIControlEvents)controlEvent;
@end
