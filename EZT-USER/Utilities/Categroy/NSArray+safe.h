//
//  NSArray+safe.h
//  EZT-USER
//
//  Created by wangmei on 17/1/10.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (safe)
/**
 *  安全读取数组数据
 *
 *  @param index 索引
 *
 *  @return 数据
 */
- (id)safeObjectAtIndex:(NSUInteger)index;
@end
