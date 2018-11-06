//
//  YHCNavigationController.m
//  angerConstellation
//
//  Created by yhc on 2018/10/9.
//  Copyright © 2018年 yhc. All rights reserved.
//

#import "YHCNavigationController.h"

@interface YHCNavigationController ()

@end

@implementation YHCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = nil;
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    [super pushViewController:viewController animated:animated];
}

@end
