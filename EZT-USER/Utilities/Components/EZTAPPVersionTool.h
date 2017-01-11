//
//  EZTAPPVersionTool.h
//  EZT-USER
//
//  Created by wangmei on 17/1/10.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EZTAPPVersionTool: NSObject

/** 之前保存的版本 */
+ (NSString *)savedAppVersion;

/** 保存新版本 */
+ (void)saveNewAppVersion:(NSString *)version;

/** 检测版本更新 */
- (void)appleAppVersionUpdate;
@end
