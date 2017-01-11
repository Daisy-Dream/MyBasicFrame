//
//  EZTUnDeallocModels.m
//  EZT-USER
//
//  Created by wangmei on 16/9/7.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import "EZTUnDeallocModels.h"

@implementation EZTUnDeallocModels
singleM(EZTUnDeallocModels)
- (NSMutableArray *)unDealocModels
{
    if (!_unDealocModels) {
        _unDealocModels = [[NSMutableArray alloc]init];
    }
    return _unDealocModels;
}

- (void)addContrllerName:(NSString *)controllerName andFloor:(NSInteger)num
{
    if (num > 1) {
        //首页不加入
        if ([[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels isKindOfClass:[NSMutableArray class]]) {
            [[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels addObject:controllerName];
        } else {
            [EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels = [NSMutableArray arrayWithArray:[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels];
            [[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels addObject:controllerName];
        }
    }
}

- (void)deallocControllerName:(NSString *)controllerName andFloor:(NSInteger)num
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels];
    for (NSString *ctlString in tempArray) {
        if ([ctlString isEqualToString:controllerName]) {
            NSInteger ctlIndex = [tempArray indexOfObjectIdenticalTo:ctlString];
            if ([[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels isKindOfClass:[NSMutableArray class]]) {
                [[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels removeObjectAtIndex:ctlIndex];
            } else {
                [EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels = [NSMutableArray arrayWithArray:[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels];
                [[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels removeObjectAtIndex:ctlIndex];
            }
            break;
        }
    }
    if ([EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels.count > 0) {
        if (num == 1) {
            //回到首层打印泄露
            MFLog(@"内存泄露对象: %@",[EZTUnDeallocModels shareEZTUnDeallocModels].unDealocModels);
        }
    }
}
@end
