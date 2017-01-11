//
//  UIActionSheet+Block.h
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionSheetBlock)(UIActionSheet *sheet,NSInteger index);

@interface UIActionSheet (Block)<UIActionSheetDelegate>
- (void)showInView:(UIView *)view handleBlock:(ActionSheetBlock)block;
@end
