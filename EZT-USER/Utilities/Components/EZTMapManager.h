//
//  MFMapManage.h
//  EZT-USER
//
//  Created by wangmei on 16/9/7.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@class EZTMapManager;

@protocol MapManagerLocationDelegate <NSObject>

@optional
/** 更新位置 */
- (void)mapManager:(EZTMapManager *)manager didUpdateAndGetLastCLLocation:(CLLocation *)location;
/** 定位失败 */
- (void)mapManager:(EZTMapManager *)manager didFailed:(NSError *)error;
/** 定位功能关闭 */
- (void)mapManagerServerClosed:(EZTMapManager *)manager;

@end

@interface EZTMapManager : NSObject

/** 代理 */
@property (nonatomic, weak)     id<MapManagerLocationDelegate> delegate;
/** 授权状态 */
@property (nonatomic, readonly) CLAuthorizationStatus          authorizationStatus;
/** 开始定位 */
- (void)start;
@end
