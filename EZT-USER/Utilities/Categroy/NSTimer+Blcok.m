//
//  NSTimer+Blcok.m
//  EZT-USER
//
//  Created by wangmei on 17/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import "NSTimer+Blcok.h"

@implementation NSTimer (Blcok)
+ (void)execHelperBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(execHelperBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(execHelperBlock:) userInfo:[block copy] repeats:repeats];
}

@end
