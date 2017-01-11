//
//  EZTNavigationController.m
//  EZT-USER
//
//  Created by wangmei on 2017/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import "EZTNavigationController.h"
#import "EZTBaseViewController.h"

@interface EZTNavigationController ()<UIGestureRecognizerDelegate>
/** 是否支持侧滑返回 */
@property(nonatomic, assign)BOOL canDragBack;
@end

@implementation EZTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor whiteColor];
    [self dealWithDargBack];
}

/** 处理侧滑返回 */
- (void)dealWithDargBack{
    
    _canDragBack                = YES;
    id target                   = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target
                                                                          action:@selector(handleNavigationTransition:)];
    pan.delegate                = self;
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
}

/** 推控制器 */
- (void)pushViewController:(EZTBaseViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        // 替换back按钮
        UIBarButtonItem *backBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"返回"
                                                                         imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)
                                                                                  target:self
                                                                                  action:@selector(back)];
        
        viewController.navigationItem.leftBarButtonItem = backBarButtonItem;
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed         = YES;
        if ([viewController respondsToSelector:@selector(canDragBack)]) {
            _canDragBack = viewController.canDragBack;
        }else{
            _canDragBack = NO;
        }
    }
    [super pushViewController:viewController animated:animated];
}

/** 返回 */
- (void)back {
    [self popViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    // 判断 gestureRecognizer 方向 translatedPoint.x < 0 向右 > 0 向左
    CGPoint translatedPoint = [gestureRecognizer translationInView:self.view];
    
    if (_canDragBack && translatedPoint.x > 0 && self.viewControllers.count > 1 ) {
        return YES;
    }else{
        return NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
