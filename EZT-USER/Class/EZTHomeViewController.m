//
//  EZTHomeViewController.m
//  EZT-USER
//
//  Created by wangmei on 2017/1/11.
//  Copyright © 2017年 wangmei. All rights reserved.
//

#import "EZTHomeViewController.h"
#import "EZTMineViewController.h"
@interface EZTHomeViewController ()

@end

@implementation EZTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = randomColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = randomColor;
    [button handleWithBlock:^(id sender) {
        [self.navigationController pushViewController:[[EZTMineViewController alloc] init] animated:YES];
    } controlEvent:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
