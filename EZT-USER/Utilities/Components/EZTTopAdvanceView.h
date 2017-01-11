//
//  EZTTopAdvanceView.h
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZTTopAdvanceView : UIView

/**
 *  设置通用属性
 *
 *  @param currentColor     pageControl选中的颜色
 *  @param otherColor       未选中的颜色
 *  @param placeholderImage imageView占位图片
 *  @param imageArray       图片资源数组（URL）
 */
- (void)setPageControlCurrentColor:(UIColor *)currentColor
                        otherColor:(UIColor *)otherColor
                  placeholderImage:(UIImage *)placeholderImage
                        imageArray:(NSArray *)imageArray;

/** 点击回调 */
@property (nonatomic, copy) void (^MFTopAdvanceImageViewClickedBlock)(NSInteger index);
@end
