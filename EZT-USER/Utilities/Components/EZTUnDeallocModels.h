//
//  EZTUnDeallocModels.h
//  EZT-USER
//
//  Created by wangmei on 16/9/7.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EZTUnDeallocModels : NSObject
singleH(EZTUnDeallocModels)

@property (strong, nonatomic) NSMutableArray *unDealocModels;

/** 添加视图名 */
- (void)addContrllerName:(NSString *)controllerName
                andFloor:(NSInteger)num;

/** 移除视图名 */
- (void)deallocControllerName:(NSString *)controllerName
                     andFloor:(NSInteger)num;   

@end
