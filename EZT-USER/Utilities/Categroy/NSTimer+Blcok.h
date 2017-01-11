//
//  NSTimer+Blcok.h
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Blcok)

+ (void)execHelperBlock:(NSTimer *)timer;

/**
 *  初始化timer
 *
 *  @param seconds 执行间隔
 *  @param block   执行方法回调
 *  @param repeats 是否重复
 *
 *  @return timer
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                      block:(void (^)(NSTimer *timer))block
                                    repeats:(BOOL)repeats;

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds
                             block:(void (^)(NSTimer *timer))block
                           repeats:(BOOL)repeats;
@end
